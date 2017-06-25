From: Anand Moon <linux.amoon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Exynos5422 Odroid-XU* incomplete
 thermal-zones definition
Date: Sun, 25 Jun 2017 22:25:32 +0530
Message-ID: <CANAwSgSZyhf-7BjwqoSAxBg=UDzCwEG=thpASEmZ=p=N5gpFQw@mail.gmail.com>
References: <20170623210913.ugutgop7ratwolfy@inc028000032.lancs.ac.uk>
 <CANAwSgSN5zi72m1td-NAaCPGLUZybSdefrKAo2t9v-gOXn3tGA@mail.gmail.com>
 <20170625133134.g4iinztozsp4p2aa@kozik-lap> <CANAwSgQV6rtbx=LqWxRS+_sRctWiU1L=np7cZU8hTYg_V8Fbnw@mail.gmail.com>
 <20170625152911.kfq7vnxyhcqvfxpu@kozik-lap>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a11c03ab610f8e10552cbb506"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170625152911.kfq7vnxyhcqvfxpu@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Willy Wolff <willy.mh.wolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

--001a11c03ab610f8e10552cbb506
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof

On 25 June 2017 at 20:59, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Sun, Jun 25, 2017 at 08:48:13PM +0530, Anand Moon wrote:
>> Hi Krzystof,
>> >> 2: We should also increase the tips from 4 to 8 to support different
>> >> cluster of cpu's.
>> >
>> > There are 4 CPU thermal zones on Exynos5422. What do you want to expand?
>>
>> What I meant was to support more trip point to address below.
>> [    2.776320] exynos-tmu 100a0000.tmu: More trip points than
>> supported by this TMU.
>> [    2.782370] exynos-tmu 100a0000.tmu: 2 trip points should be
>> configured in polling mode.
>>
>
> I do not understand what you want to achieve. I added 2 trip points in
> polling mode for the CPU cooling mode. Just describe the problem and
> send the patch - it is the best way to explain one's thought...
>
>> >> 3: To avoid duplication of cooling-maps we can make tmu sensor work
>> >> differently for cluster of cpu's
>> >>       tmu_cpu0: handle pwm-fan control.
>> >>       tmu_cpu1: handle cpu[0-3] cpufreq mapping.
>> >>       tmu_cpu2: handle cpu[4-7] cpufreq mapping.
>> >
>> > I miss the point behind this. Why fan should work only when CPU4
>> > (tmu_cpu0) is heated and not CPU5-7 (rest of cpu tmu's)?
>>
>> Ok fan should work on all the thermal zone. To avoid thermal shutdown.
>>
>> But I want to avoid scaling down of all the cores of cpu to low freq
>> as cooling-maps cross the alert temperature. For below example.
>> ----
>>  map3 {
>>               trip = <&cpu1_alert3>;
>>               cooling-device = <&cpu0 0 2>;
>>  };
>>  map4 {
>>               trip = <&cpu1_alert3>;
>>               cooling-device = <&cpu4 0 2>;
>>  };
>>
>>  map5 {
>>               trip = <&cpu1_alert4>;
>>               cooling-device = <&cpu0 3 7>;
>>  };
>>  map6 {
>>              trip = <&cpu1_alert4>;
>>              cooling-device = <&cpu4 3 12>;
>>  };
>>
>> What I want to configure thermal zone as.
>>
>> cpu0_thermal: cpu0-thermal {
>>      configure cluster of cpu[0-3]
>>      {
>>         tips
>>      }
>>      cooling map
>>      {
>>          device handle cpu[0-3] with frequency scaling at particular
>> alert temperature.
>>      }
>> }
>
> cpu0_thermal is attached to tmu_cpu0 which is the temperature of CPU4
> (first big core). I do not see reason behind connecting thermal zone
> (thus temperature) of CPU4 with frequency of LITTLE cluster (CPU0-3). In
> case of busy CPU4, you will scale down CPU0-3. Does not make sense.
>

Both the cpu cluster are independent and have different cpu-freqency scaling.
that is the reason to for my changes.

>> cpu1_thermal: cpu1-thermal {
>>      configure cluster of cpu[4-7]
>>      {
>>         tips
>>      }
>>      cooling map
>>      {
>>          device handle cpu[4-7] with frequency scaling at particular
>> alert temperature.
>>      }
>> }
>>
>> We can chose to configure rest of the thermal-zone on this approach.
>> Please share your thoughts.
>
> I am sorry, I do not understand the idea, the problem nor the solution.
>
> Best regards,
> Krzysztof
>

Sorry for not able to express my self in technical terms.
my changes are based on exynos5433-tmu at this moment.
Just attaching small patch to share my point.

Best Regards
-Anand Moon

--001a11c03ab610f8e10552cbb506
Content-Type: application/octet-stream; name="tmu.patch"
Content-Disposition: attachment; filename="tmu.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j4cy15uw0

ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1v
bi5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvZXh5bm9zNTQyMi1vZHJvaWR4dTMtY29tbW9uLmR0
c2kKaW5kZXggMDViOWFmZGQuLjY2YjRlYTMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2V4eW5vczU0MjItb2Ryb2lkeHUzLWNvbW1vbi5kdHNpCkBAIC02NCw4MyArNjQsMjE5IEBACiAJ
CQlwb2xsaW5nLWRlbGF5LXBhc3NpdmUgPSA8MjUwPjsKIAkJCXBvbGxpbmctZGVsYXkgPSA8MD47
CiAJCQl0cmlwcyB7Ci0JCQkJY3B1X2FsZXJ0MDogY3B1LWFsZXJ0LTAgewotCQkJCQl0ZW1wZXJh
dHVyZSA9IDw1MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwotCQkJCQloeXN0ZXJlc2lzID0gPDUw
MDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQljcHUwX2FsZXJ0MDogY3B1LWFsZXJ0LTAgewor
CQkJCQl0ZW1wZXJhdHVyZSA9IDw2NTAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0
ZXJlc2lzID0gPDEwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KIAkJCQkJdHlwZSA9ICJhY3RpdmUi
OwogCQkJCX07Ci0JCQkJY3B1X2FsZXJ0MTogY3B1LWFsZXJ0LTEgewotCQkJCQl0ZW1wZXJhdHVy
ZSA9IDw2MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwotCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+
OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQljcHUwX2FsZXJ0MTogY3B1LWFsZXJ0LTEgeworCQkJ
CQl0ZW1wZXJhdHVyZSA9IDw3MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0ZXJl
c2lzID0gPDEwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KIAkJCQkJdHlwZSA9ICJhY3RpdmUiOwog
CQkJCX07Ci0JCQkJY3B1X2FsZXJ0MjogY3B1LWFsZXJ0LTIgewotCQkJCQl0ZW1wZXJhdHVyZSA9
IDw3MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwotCQkJCQloeXN0ZXJlc2lzID0gPDUwMDA+OyAv
KiBtaWxsaWNlbHNpdXMgKi8KKwkJCQljcHUwX2FsZXJ0MjogY3B1LWFsZXJ0LTIgeworCQkJCQl0
ZW1wZXJhdHVyZSA9IDw4MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0ZXJlc2lz
ID0gPDEwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJdHlwZSA9ICJhY3RpdmUiOworCQkJ
CX07CisJCQkJY3B1MF9hbGVydDM6IGNwdS1hbGVydC0zIHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8
ODUwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgLyog
bWlsbGljZWxzaXVzICovCiAJCQkJCXR5cGUgPSAiYWN0aXZlIjsKIAkJCQl9OwotCQkJCWNwdV9j
cml0MDogY3B1LWNyaXQtMCB7CisJCQkJY3B1MF9hbGVydDQ6IGNwdS1hbGVydC00IHsKKwkJCQkJ
dGVtcGVyYXR1cmUgPSA8OTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNp
cyA9IDwxMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJ
CQl9OworCQkJCWNwdTBfYWxlcnQ1OiBjcHUtYWxlcnQtNSB7CisJCQkJCXRlbXBlcmF0dXJlID0g
PDk1MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMgPSA8MTAwMD47IC8q
IG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImFjdGl2ZSI7CisJCQkJfTsKKwkJCQljcHUw
X2FsZXJ0NjogY3B1LWFsZXJ0LTYgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMDAwMDA+OyAvKiBt
aWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgLyogbWlsbGljZWxzaXVz
ICovCisJCQkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJCQl9OworCQkJCWNwdTBfY3JpdDA6IGNwdS1j
cml0LTAgewogCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMjAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8K
LQkJCQkJaHlzdGVyZXNpcyA9IDwwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVz
aXMgPSA8MTAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwogCQkJCQl0eXBlID0gImNyaXRpY2FsIjsK
IAkJCQl9OwotCQkJCS8qCi0JCQkJICogRXh5bm9zNTQyeCBzdXBwb3J0cyBvbmx5IDQgdHJpcC1w
b2ludHMKLQkJCQkgKiBzbyBmb3IgdGhlc2UgcG9sbGluZyBtb2RlIGlzIHJlcXVpcmVkLgotCQkJ
CSAqIFN0YXJ0IHBvbGxpbmcgYXQgdGVtcGVyYXR1cmUgbGV2ZWwgb2YgbGFzdAotCQkJCSAqIGlu
dGVycnVwdC1kcml2ZW4gdHJpcDogY3B1X2FsZXJ0MgotCQkJCSAqLwotCQkJCWNwdV9hbGVydDM6
IGNwdS1hbGVydC0zIHsKKwkJCX07CisJCQljb29saW5nLW1hcHMgeworCQkJCW1hcDAgeworCQkJ
CQl0cmlwID0gPCZjcHUwX2FsZXJ0MD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZmYW4wIDAg
MT47CisJCQkJfTsKKwkJCQltYXAxIHsKKwkJCQkJdHJpcCA9IDwmY3B1MF9hbGVydDE+OworCQkJ
CQljb29saW5nLWRldmljZSA9IDwmZmFuMCAxIDI+OworCQkJCX07CisJCQkJbWFwMiB7CisJCQkJ
CXRyaXAgPSA8JmNwdTBfYWxlcnQyPjsKKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmZhbjAgMiAz
PjsKKwkJCQl9OworCQkJCW1hcDMgeworCQkJCQkvKiBTZXQgbWF4aW11bSBmcmVxdWVuY3kgYXMg
MTIwME1IeiAgKi8KKwkJCQkJdHJpcCA9IDwmY3B1MF9hbGVydDI+OworCQkJCQljb29saW5nLWRl
dmljZSA9IDwmY3B1MCAxIDI+OworCQkJCX07CisJCQkJbWFwNCB7CisJCQkJCS8qIFNldCBtYXhp
bXVtIGZyZXF1ZW5jeSBhcyAxMTAwTUh6ICAqLworCQkJCQl0cmlwID0gPCZjcHUwX2FsZXJ0Mz47
CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIDIgMz47CisJCQkJfTsKKwkJCQltYXA1IHsK
KwkJCQkJLyogU2V0IG1heGltdW0gZnJlcXVlbmN5IGFzIDEwMDBNSHogICovCisJCQkJCXRyaXAg
PSA8JmNwdTBfYWxlcnQ0PjsKKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgMyA0PjsKKwkJ
CQl9OworCQkJCW1hcDYgeworCQkJCQkvKiBTZXQgbWF4aW11bSBmcmVxdWVuY3kgYXMgOTAwTUh6
ICAqLworCQkJCQl0cmlwID0gPCZjcHUwX2FsZXJ0NT47CisJCQkJCWNvb2xpbmctZGV2aWNlID0g
PCZjcHUwIDQgNT47CisJCQkJfTsKKwkJCQltYXA3IHsKKwkJCQkJLyogU2V0IG1heGltdW0gZnJl
cXVlbmN5IGFzIDgwME1IeiAgKi8KKwkJCQkJdHJpcCA9IDwmY3B1MF9hbGVydDY+OworCQkJCQlj
b29saW5nLWRldmljZSA9IDwmY3B1MCA1IDk+OworCQkJCX07CisJCQl9OworCQl9OworCQljcHUx
X3RoZXJtYWw6IGNwdTEtdGhlcm1hbCB7CisJCQl0aGVybWFsLXNlbnNvcnMgPSA8JnRtdV9jcHUx
IDA+OworCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDI1MD47CisJCQlwb2xsaW5nLWRlbGF5
ID0gPDA+OworCQkJdHJpcHMgeworCQkJCWNwdTFfYWxlcnQwOiBjcHUtYWxlcnQtMCB7CisJCQkJ
CXRlbXBlcmF0dXJlID0gPDY1MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVz
aXMgPSA8MTAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImFjdGl2ZSI7CisJ
CQkJfTsKKwkJCQljcHUxX2FsZXJ0MTogY3B1LWFsZXJ0LTEgewogCQkJCQl0ZW1wZXJhdHVyZSA9
IDw3MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwotCQkJCQloeXN0ZXJlc2lzID0gPDEwMDAwPjsg
LyogbWlsbGljZWxzaXVzICovCi0JCQkJCXR5cGUgPSAicGFzc2l2ZSI7CisJCQkJCWh5c3RlcmVz
aXMgPSA8MTAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImFjdGl2ZSI7CiAJ
CQkJfTsKLQkJCQljcHVfYWxlcnQ0OiBjcHUtYWxlcnQtNCB7CisJCQkJY3B1MV9hbGVydDI6IGNw
dS1hbGVydC0yIHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8ODAwMDA+OyAvKiBtaWxsaWNlbHNpdXMg
Ki8KKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5
cGUgPSAiYWN0aXZlIjsKKwkJCQl9OworCQkJCWNwdTFfYWxlcnQzOiBjcHUtYWxlcnQtMyB7CiAJ
CQkJCXRlbXBlcmF0dXJlID0gPDg1MDAwPjsgLyogbWlsbGljZWxzaXVzICovCi0JCQkJCWh5c3Rl
cmVzaXMgPSA8MTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KLQkJCQkJdHlwZSA9ICJwYXNzaXZl
IjsKKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5
cGUgPSAiYWN0aXZlIjsKIAkJCQl9OwotCisJCQkJY3B1MV9hbGVydDQ6IGNwdS1hbGVydC00IHsK
KwkJCQkJdGVtcGVyYXR1cmUgPSA8OTAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlz
dGVyZXNpcyA9IDwxMDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5cGUgPSAiYWN0aXZl
IjsKKwkJCQl9OworCQkJCWNwdTFfYWxlcnQ1OiBjcHUtYWxlcnQtNSB7CisJCQkJCXRlbXBlcmF0
dXJlID0gPDk1MDAwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMgPSA8MTAw
MD47IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQl0eXBlID0gImFjdGl2ZSI7CisJCQkJfTsKKwkJ
CQljcHUxX2FsZXJ0NjogY3B1LWFsZXJ0LTYgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMDAwMDA+
OyAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgLyogbWlsbGlj
ZWxzaXVzICovCisJCQkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJCQl9OworCQkJCWNwdTFfY3JpdDA6
IGNwdS1jcml0LTAgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDwxMjAwMDA+OyAvKiBtaWxsaWNlbHNp
dXMgKi8KKwkJCQkJaHlzdGVyZXNpcyA9IDwwPjsgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5
cGUgPSAiY3JpdGljYWwiOworCQkJCX07CisJCQkJCiAJCQl9OwogCQkJY29vbGluZy1tYXBzIHsK
IAkJCQltYXAwIHsKLQkJCQkJdHJpcCA9IDwmY3B1X2FsZXJ0MD47CisJCQkJCXRyaXAgPSA8JmNw
dTFfYWxlcnQwPjsKIAkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmZhbjAgMCAxPjsKIAkJCQl9Owog
CQkJCW1hcDEgewotCQkJCQl0cmlwID0gPCZjcHVfYWxlcnQxPjsKKwkJCQkJdHJpcCA9IDwmY3B1
MV9hbGVydDE+OwogCQkJCQljb29saW5nLWRldmljZSA9IDwmZmFuMCAxIDI+OwogCQkJCX07CiAJ
CQkJbWFwMiB7Ci0JCQkJCXRyaXAgPSA8JmNwdV9hbGVydDI+OworCQkJCQl0cmlwID0gPCZjcHUx
X2FsZXJ0Mj47CiAJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZmYW4wIDIgMz47CiAJCQkJfTsKLQkJ
CQkvKgotCQkJCSAqIFdoZW4gcmVhY2hpbmcgY3B1X2FsZXJ0MywgcmVkdWNlIENQVQotCQkJCSAq
IGJ5IDIgc3RlcHMuIE9uIEV4eW5vczU0MjIvNTgwMCB0aGF0IHdvdWxkCi0JCQkJICogYmU6IDE2
MDAgTUh6IGFuZCAxMTAwIE1Iei4KLQkJCQkgKi8KIAkJCQltYXAzIHsKLQkJCQkJdHJpcCA9IDwm
Y3B1X2FsZXJ0Mz47Ci0JCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIDAgMj47CisJCQkJCS8q
IFNldCBtYXhpbXVtIGZyZXF1ZW5jeSBhcyAxODAwTUh6ICAqLworCQkJCQl0cmlwID0gPCZjcHUx
X2FsZXJ0MD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHU0IDEgMj47CiAJCQkJfTsKIAkJ
CQltYXA0IHsKLQkJCQkJdHJpcCA9IDwmY3B1X2FsZXJ0Mz47Ci0JCQkJCWNvb2xpbmctZGV2aWNl
ID0gPCZjcHU0IDAgMj47CisJCQkJCS8qIFNldCBtYXhpbXVtIGZyZXF1ZW5jeSBhcyAxNzAwTUh6
ICAqLworCQkJCQl0cmlwID0gPCZjcHUxX2FsZXJ0MT47CisJCQkJCWNvb2xpbmctZGV2aWNlID0g
PCZjcHU0IDIgMz47CiAJCQkJfTsKLQotCQkJCS8qCi0JCQkJICogV2hlbiByZWFjaGluZyBjcHVf
YWxlcnQ0LCByZWR1Y2UgQ1BVCi0JCQkJICogZnVydGhlciwgZG93biB0byA2MDAgTUh6ICgxMSBz
dGVwcyBmb3IgYmlnLAotCQkJCSAqIDcgc3RlcHMgZm9yIExJVFRMRSkuCi0JCQkJICovCiAJCQkJ
bWFwNSB7Ci0JCQkJCXRyaXAgPSA8JmNwdV9hbGVydDQ+OwotCQkJCQljb29saW5nLWRldmljZSA9
IDwmY3B1MCAzIDc+OworCQkJCQkvKiBTZXQgbWF4aW11bSBmcmVxdWVuY3kgYXMgMTYwME1IeiAg
Ki8KKwkJCQkJdHJpcCA9IDwmY3B1MV9hbGVydDI+OworCQkJCQljb29saW5nLWRldmljZSA9IDwm
Y3B1NCAzIDQ+OwogCQkJCX07CiAJCQkJbWFwNiB7Ci0JCQkJCXRyaXAgPSA8JmNwdV9hbGVydDQ+
OwotCQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1NCAzIDExPjsKKwkJCQkJLyogU2V0IG1heGlt
dW0gZnJlcXVlbmN5IGFzIDE1MDBNSHogICovCisJCQkJCXRyaXAgPSA8JmNwdTFfYWxlcnQzPjsK
KwkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTQgNCA1PjsKKwkJCQl9OworCQkJCW1hcDcgewor
CQkJCQkvKiBTZXQgbWF4aW11bSBmcmVxdWVuY3kgYXMgMTQwME1IeiAgKi8KKwkJCQkJdHJpcCA9
IDwmY3B1MV9hbGVydDQ+OworCQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1NCA1IDc+OworCQkJ
CX07CisJCQkJbWFwOCB7CisJCQkJCS8qIFNldCBtYXhpbXVtIGZyZXF1ZW5jeWFzIDEyMDBNSHog
ICovCisJCQkJCXRyaXAgPSA8JmNwdTFfYWxlcnQ1PjsKKwkJCQkJY29vbGluZy1kZXZpY2UgPSA8
JmNwdTQgNyA5PjsKKwkJCQl9OworCQkJCW1hcDkgeworCQkJCQkvKiBTZXQgbWF4aW11bSBmcmVx
dWVuY3kgYXMgMTAwME1IeiAgKi8KKwkJCQkJdHJpcCA9IDwmY3B1MV9hbGVydDY+OworCQkJCQlj
b29saW5nLWRldmljZSA9IDwmY3B1NCA5IDE0PjsKKwkJCQl9OworCQkJfTsKKwkJfTsKKworCQln
cHVfdGhlcm1hbDogZ3B1LXRoZXJtYWwgeworCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0bXVfZ3B1
PjsKKwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwyNTA+OworCQkJcG9sbGluZy1kZWxheSA9
IDwwPjsKKwkJCXRyaXBzIHsKKwkJCQlncHVfYWxlcnQwOiBncHUtYWxlcnQtMCB7CisJCQkJCXRl
bXBlcmF0dXJlID0gPDcwMDAwPjsgIC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0ZXJlc2lz
ID0gPDEwMDA+OyAgICAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJdHlwZSA9ICJhY3RpdmUiOwor
CQkJCX07CisJCQkJZ3B1X2FsZXJ0MTogZ3B1LWFsZXJ0LTEgeworCQkJCQl0ZW1wZXJhdHVyZSA9
IDw3NTAwMD47ICAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsg
ICAgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5cGUgPSAiYWN0aXZlIjsKKwkJCQl9OworCQkJ
CWdwdV9hbGVydF8yOiBncHUtYWxlcnQtMiB7CisJCQkJCXRlbXBlcmF0dXJlID0gPDgwMDAwPjsg
IC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0ZXJlc2lzID0gPDEwMDA+OyAgICAvKiBtaWxs
aWNlbHNpdXMgKi8KKwkJCQkJdHlwZSA9ICJhY3RpdmUiOworCQkJCX07CisJCQkJZ3B1X2FsZXJ0
XzM6IGdwdS1hbGVydC0zIHsKKwkJCQkJdGVtcGVyYXR1cmUgPSA8ODUwMDA+OyAgLyogbWlsbGlj
ZWxzaXVzICovCisJCQkJCWh5c3RlcmVzaXMgPSA8MTAwMD47ICAgIC8qIG1pbGxpY2Vsc2l1cyAq
LworCQkJCQl0eXBlID0gImFjdGl2ZSI7CisJCQkJfTsKKwkJCQlncHVfYWxlcnRfNDogZ3B1LWFs
ZXJ0LTQgeworCQkJCQl0ZW1wZXJhdHVyZSA9IDw5MDAwMD47ICAvKiBtaWxsaWNlbHNpdXMgKi8K
KwkJCQkJaHlzdGVyZXNpcyA9IDwxMDAwPjsgICAgLyogbWlsbGljZWxzaXVzICovCisJCQkJCXR5
cGUgPSAiYWN0aXZlIjsKKwkJCQl9OworCQkJCWdwdV9hbGVydF81OiBncHUtYWxlcnQtNSB7CisJ
CQkJCXRlbXBlcmF0dXJlID0gPDk1MDAwPjsgIC8qIG1pbGxpY2Vsc2l1cyAqLworCQkJCQloeXN0
ZXJlc2lzID0gPDEwMDA+OyAgICAvKiBtaWxsaWNlbHNpdXMgKi8KKwkJCQkJdHlwZSA9ICJhY3Rp
dmUiOwogCQkJCX07CiAJCQl9OwogCQl9Owo=
--001a11c03ab610f8e10552cbb506--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
