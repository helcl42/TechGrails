import java.security.MessageDigest
import sun.misc.BASE64Encoder
import sun.misc.CharacterEncoder
/**
 * Created with IntelliJ IDEA.
 * User: lubos
 * Date: 7/19/12
 * Time: 8:25 PM
 * To change this template use File | Settings | File Templates.
 */

class HashUtil {
    static encode = { str ->
        MessageDigest md = MessageDigest.getInstance('SHA')
        md.update(str.getBytes('UTF-8'))
        return (new BASE64Encoder()).encode(md.digest())
    }
}
