/** THIS IS AN AUTOMATICALLY GENERATED FILE.  DO NOT MODIFY
 * BY HAND!!
 *
 * Generated by lcm-gen
 **/

#include <lcm/lcm_coretypes.h>

#ifndef __drake_lcmt_support_data_hpp__
#define __drake_lcmt_support_data_hpp__

#include <vector>

namespace drake
{

class lcmt_support_data
{
    public:
        int64_t    timestamp;
        int32_t    body_id;
        int32_t    num_contact_pts;
        std::vector< std::vector< double > > contact_pts;
        int8_t     support_logic_map[4];
        int8_t     use_support_surface;
        float      support_surface[4];
        double     mu;

    public:
        inline int encode(void *buf, int offset, int maxlen) const;
        inline int getEncodedSize() const;
        inline int decode(const void *buf, int offset, int maxlen);
        inline static int64_t getHash();
        inline static const char* getTypeName();

        // LCM support functions. Users should not call these
        inline int _encodeNoHash(void *buf, int offset, int maxlen) const;
        inline int _getEncodedSizeNoHash() const;
        inline int _decodeNoHash(const void *buf, int offset, int maxlen);
        inline static int64_t _computeHash(const __lcm_hash_ptr *p);
};

int lcmt_support_data::encode(void *buf, int offset, int maxlen) const
{
    int pos = 0, tlen;
    int64_t hash = getHash();

    tlen = __int64_t_encode_array(buf, offset + pos, maxlen - pos, &hash, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = this->_encodeNoHash(buf, offset + pos, maxlen - pos);
    if (tlen < 0) return tlen; else pos += tlen;

    return pos;
}

int lcmt_support_data::decode(const void *buf, int offset, int maxlen)
{
    int pos = 0, thislen;

    int64_t msg_hash;
    thislen = __int64_t_decode_array(buf, offset + pos, maxlen - pos, &msg_hash, 1);
    if (thislen < 0) return thislen; else pos += thislen;
    if (msg_hash != getHash()) return -1;

    thislen = this->_decodeNoHash(buf, offset + pos, maxlen - pos);
    if (thislen < 0) return thislen; else pos += thislen;

    return pos;
}

int lcmt_support_data::getEncodedSize() const
{
    return 8 + _getEncodedSizeNoHash();
}

int64_t lcmt_support_data::getHash()
{
    static int64_t hash = _computeHash(NULL);
    return hash;
}

const char* lcmt_support_data::getTypeName()
{
    return "lcmt_support_data";
}

int lcmt_support_data::_encodeNoHash(void *buf, int offset, int maxlen) const
{
    int pos = 0, tlen;

    tlen = __int64_t_encode_array(buf, offset + pos, maxlen - pos, &this->timestamp, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __int32_t_encode_array(buf, offset + pos, maxlen - pos, &this->body_id, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __int32_t_encode_array(buf, offset + pos, maxlen - pos, &this->num_contact_pts, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    for (int a0 = 0; a0 < 3; a0++) {
        tlen = __double_encode_array(buf, offset + pos, maxlen - pos, &this->contact_pts[a0][0], this->num_contact_pts);
        if(tlen < 0) return tlen; else pos += tlen;
    }

    tlen = __boolean_encode_array(buf, offset + pos, maxlen - pos, &this->support_logic_map[0], 4);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __boolean_encode_array(buf, offset + pos, maxlen - pos, &this->use_support_surface, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __float_encode_array(buf, offset + pos, maxlen - pos, &this->support_surface[0], 4);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __double_encode_array(buf, offset + pos, maxlen - pos, &this->mu, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    return pos;
}

int lcmt_support_data::_decodeNoHash(const void *buf, int offset, int maxlen)
{
    int pos = 0, tlen;

    tlen = __int64_t_decode_array(buf, offset + pos, maxlen - pos, &this->timestamp, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __int32_t_decode_array(buf, offset + pos, maxlen - pos, &this->body_id, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __int32_t_decode_array(buf, offset + pos, maxlen - pos, &this->num_contact_pts, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    this->contact_pts.resize(3);
    for (int a0 = 0; a0 < 3; a0++) {
        this->contact_pts[a0].resize(this->num_contact_pts);
        if(this->num_contact_pts) {
            tlen = __double_decode_array(buf, offset + pos, maxlen - pos, &this->contact_pts[a0][0], this->num_contact_pts);
            if(tlen < 0) return tlen; else pos += tlen;
        }
    }

    tlen = __boolean_decode_array(buf, offset + pos, maxlen - pos, &this->support_logic_map[0], 4);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __boolean_decode_array(buf, offset + pos, maxlen - pos, &this->use_support_surface, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __float_decode_array(buf, offset + pos, maxlen - pos, &this->support_surface[0], 4);
    if(tlen < 0) return tlen; else pos += tlen;

    tlen = __double_decode_array(buf, offset + pos, maxlen - pos, &this->mu, 1);
    if(tlen < 0) return tlen; else pos += tlen;

    return pos;
}

int lcmt_support_data::_getEncodedSizeNoHash() const
{
    int enc_size = 0;
    enc_size += __int64_t_encoded_array_size(NULL, 1);
    enc_size += __int32_t_encoded_array_size(NULL, 1);
    enc_size += __int32_t_encoded_array_size(NULL, 1);
    enc_size += 3 * __double_encoded_array_size(NULL, this->num_contact_pts);
    enc_size += __boolean_encoded_array_size(NULL, 4);
    enc_size += __boolean_encoded_array_size(NULL, 1);
    enc_size += __float_encoded_array_size(NULL, 4);
    enc_size += __double_encoded_array_size(NULL, 1);
    return enc_size;
}

int64_t lcmt_support_data::_computeHash(const __lcm_hash_ptr *)
{
    int64_t hash = 0xb20528d1582894d1LL;
    return (hash<<1) + ((hash>>63)&1);
}

}

#endif