const prismaHelper = {
    handleFilterOrderFindMany(filters) {
        let where = {};
        // validate filters
        if (filters) {
            filters = JSON.parse(filters);
            Object.entries(filters).forEach(([key, value]) => {
                if (key === "food_name") {
                    where.food = {
                        [key]: {
                            contains: value,
                        }
                    }
                } else if (key === 'full_name') {
                    where.user = {
                        [key]: {
                            contains: value
                        }
                    }
                } else if (typeof value === 'string') {
                    where[key] = {contains: value}
                } else if (Number.isInteger(value)) {
                    where[key] = value
                } else {
                    throw new Error("")
                }
            });
            return where;
        }
    }
}

export default prismaHelper