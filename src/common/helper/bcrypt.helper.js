import * as bcrypt from 'bcrypt';
const saltRounds = 10;

export default {
    encode(plaintext) {
        const salt = bcrypt.genSaltSync(saltRounds);
        const hash = bcrypt.hashSync(plaintext, salt);
        return hash;
    },

    compare(plaintext, hash) {
        return bcrypt.compareSync(plaintext, hash); // true
    }
}