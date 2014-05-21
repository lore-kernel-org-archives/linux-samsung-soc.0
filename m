From: Chirantan Ekbote <chirantan@chromium.org>
Subject: Re: [PATCH] arm: dts: exynos5: Remove multi core timer
Date: Wed, 21 May 2014 11:34:12 -0700
Message-ID: <CAJFHJroU1RO8YXN4eSEsPz=QNf0i8OXhXy0i9Em1Zkm9rDSJdA@mail.gmail.com>
References: <1400188079-21832-1-git-send-email-chirantan@chromium.org>
	<53752E25.9060604@gmail.com>
	<CAD=FV=WKOtZaUyzTWNqR=vi_L=U-Q1dct2U_oCYi3ZJv6401Hg@mail.gmail.com>
	<53753443.8010303@gmail.com>
	<CAD=FV=V8UZoeOqEwfx_E015pLM+amTt51LrUa+dk7mTdn=vKgA@mail.gmail.com>
	<53753C17.1090002@gmail.com>
	<CAD=FV=WGa7j_As_NpySxU7OEd_SzuGWK6oxU6UeiJ-4HsoWvvg@mail.gmail.com>
	<CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com>
	<CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com>
	<53754CE2.3000905@gmail.com>
	<CAD=FV=UMoL7i9rg_QtBAqPwisSQyRqRmk8wQhneMXAiLBjTT1A@mail.gmail.com>
	<CAPz6YkU8GDrLj8UkqEQXxxqxWF5_p427wKSDgAp+QPR7WE7Ujg@mail.gmail.com>
	<CAJFHJrrb2XFDZqJh4OuLdFP=J0aR4pGe-WLWKZ7ZpMfUSPGd4Q@mail.gmail.com>
	<033a01cf74f2$d025ce80$70716b80$@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a1133194a319cae04f9ed3e8a
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:61635 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137AbaEUSeN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 14:34:13 -0400
Received: by mail-ob0-f175.google.com with SMTP id wo20so2581116obc.34
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 11:34:13 -0700 (PDT)
In-Reply-To: <033a01cf74f2$d025ce80$70716b80$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sonny Rao <sonnyrao@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, David Riley <davidriley@google.com>, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

--001a1133194a319cae04f9ed3e8a
Content-Type: text/plain; charset=UTF-8

On Wed, May 21, 2014 at 5:47 AM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Chirantan Ekbote wrote:
>>
>> >>> Anyway, I'm by no means opposed to switching to arch timers. They
>> >>> provide a well designed, generic interface and drivers shared by
>> >>> multiple platforms, which means more code sharing and possibly more eyes
>> >>> looking at the code, which is always good. However if they don't support
>> >>> low power states correctly, we can't just remove MCT.
>> >>
>> >> I think low power states aren't in mainline (right?).
>> >>
>> >> One solution that might work could be to leave the device tree entry
>> >> alone but change the MCT init code to simply act as a no-op if it sees
>> >> an arch timer is in the device tree and enabled.  Then when/if someone
>> >> got the low power states enabled we could just change source code
>> >> rather than dts files.
>> >>
>> Doug and I were talking about this and we think we may have a way to
>> have the mct and arch timers co-exist.  The main issue is that the mct
>> (and therefore arch timer) gets cleared once during boot and every
>> time we do a suspend / resume.  This happens in
>> exynos4_mct_frc_start() but it's not immediately clear to us why the
>> counter needs to be reset at all.  If we remove the lines that clear
>> the counter then there is no longer an issue with having both the mct
>> and the arch timers on at the same time.
>>
> Yeah, actually we don't need to reset the count value after suspend/resume.
> So, how about following? I think, it should be fine to you.
>
> diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> index 8d64200..d24db6f 100644
> --- a/drivers/clocksource/exynos_mct.c
> +++ b/drivers/clocksource/exynos_mct.c
> @@ -157,12 +157,15 @@ static void exynos4_mct_frc_start(u32 hi, u32 lo)
>  {
>         u32 reg;
>
> -       exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L);
> -       exynos4_mct_write(hi, EXYNOS4_MCT_G_CNT_U);
> -
>         reg = __raw_readl(reg_base + EXYNOS4_MCT_G_TCON);
> -       reg |= MCT_G_TCON_START;
> -       exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
> +
> +       if (!(reg & MCT_G_TCON_START)) {
> +               exynos4_mct_write(lo, EXYNOS4_MCT_G_CNT_L);
> +               exynos4_mct_write(hi, EXYNOS4_MCT_G_CNT_U);
> +
> +               reg |= MCT_G_TCON_START;
> +               exynos4_mct_write(reg, EXYNOS4_MCT_G_TCON);
> +       }
>  }
>

So if I understand correctly, we still need to reset the counter
during boot?  This is still a problem because there would be a big
jump in time since the sched_clock code would think that the timer had
wrapped around.  Additionally, any clock events that were scheduled
before the reset would be delayed until the cycle counter caught back
up to the value it had previously.  This manifests itself in our tree
as an extra long jiffy when the xor code is measuring the software
checksum speed and it delays the entire boot process.

There is a hacky solution to this, which is to ensure that the mct is
always initialized before the arch timer.  This should be possible by
reordering the entries in the device tree.  We would also need to
change the clocksource rating for one of the two (either increase the
arch timer rating or decrease the mct rating) to ensure that the
kernel still picked the arch timer as its clocksource.

>
>> Alternately, if there is some code that depends on the mct being reset
>> we could store an offset instead of clearing the counter and then
>> subtract that offset every time something reads it.  Doug has a patch
>> that does this at
>> https://chromium-review.googlesource.com/#/c/200298/.  Effectively the
>> visible behavior will not change.  Would either of these options work?
>>
> Hmm...I cannot open the webpage :(
>

I've attached the patch to this email.

Chirantan

--001a1133194a319cae04f9ed3e8a
Content-Type: text/x-patch; charset=US-ASCII;
	name="0001-clocksource-mct-Don-t-clear-the-mct.patch"
Content-Disposition: attachment;
	filename="0001-clocksource-mct-Don-t-clear-the-mct.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hvgyfvdx0

RnJvbSA0NjhhYjk1ZmI1N2YxYjcyZGE4MzhhYTQ2MzQ2NjM1YTQ4YTk0YWY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+
CkRhdGU6IEZyaSwgMTYgTWF5IDIwMTQgMTQ6MTI6MTMgLTA3MDAKU3ViamVjdDogW1BBVENIXSBj
bG9ja3NvdXJjZTogbWN0OiBEb24ndCBjbGVhciB0aGUgbWN0CgpPbiBleHlub3M1IFNvQ3MsIHRo
ZSBtY3QgYW5kIHRoZSBhcmNoIHRpbWVycyBhcHBlYXIgdG8gc2hhcmUgdGhlIHNhbWUKcm9vdCB0
aW1lci4gIC4uLnNvIGNsZWFyaW5nIHRoZSBtY3QgYWN0dWFsbHkgZW5kcyB1cCBjbGVhcmluZyB1
cCB0aGUKYXJjaCB0aW1lciBhbmQgdGhhdCBjb25mdXNlcyB0aGUgaGVjayBvdXQgb2YgdGhlIGFy
Y2ggdGltZXIgY29kZS4KCkxldCdzIGFsbG93IHRoZSBhcmNoIHRpbWVyIGFuZCBtY3QgZHJpdmVy
IHRvIGNvZXhpc3QgYnkganVzdCBub3QgZXZlcgpjbGVhcmluZyB0aGUgdGltZXIuICBKdXN0IGlu
IGNhc2Ugc29tZW9uZSBjYXJlcywgd2UnbGwgc3RpbGwgcHJldGVuZAp0aGF0IHdlIGNsZWFyZWQg
aXQgYnkga2VlcGluZyB0cmFjayBvZiBvdXIgb3duIG9mZnNldC4KCkJVRz1jaHJvbWUtb3MtcGFy
dG5lcjoxMzgwNQpURVNUPUFyY2ggdGltZXIgbm8gbG9uZ2VycyBnb2VzIGFsbCBzY3Jld3kKCkNo
YW5nZS1JZDogSTJjNGJkM2NiMGZlZGU2N2MzNmEyNzM0YjI5NzI3NjNmMDc5ZjI4NzIKU2lnbmVk
LW9mZi1ieTogRG91ZyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZl
cnMvY2xvY2tzb3VyY2UvZXh5bm9zX21jdC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDE4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvZXh5bm9zX21jdC5j
IGIvZHJpdmVycy9jbG9ja3NvdXJjZS9leHlub3NfbWN0LmMKaW5kZXggYjA2NzIxOS4uMzJiODAw
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9leHlub3NfbWN0LmMKKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS9leHlub3NfbWN0LmMKQEAgLTkzLDYgKzkzLDcgQEAgc3RhdGljIHVu
c2lnbmVkIGxvbmcgY2xrX3JhdGU7CiBzdGF0aWMgdW5zaWduZWQgaW50IG1jdF9pbnRfdHlwZTsK
IHN0YXRpYyBpbnQgbWN0X2lycXNbTUNUX05SX0lSUVNdOwogc3RhdGljIGludCBucl9tY3RfaXJx
czsKK3N0YXRpYyBjeWNsZV90IGV4eW5vc19tY3Rfb2Zmc2V0OwogCiBzdGF0aWMgY29uc3QgY2hh
ciAqaXJxX25hbWVzW01DVF9OUl9MT0NBTF9JUlFTXSA9IHsKIAkibWN0X3RpY2swX2lycSIsCkBA
IC0xNzYsMjQgKzE3NywxMyBAQCBzdGF0aWMgdm9pZCBleHlub3M0X21jdF93cml0ZSh1bnNpZ25l
ZCBpbnQgdmFsdWUsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0KQogfQogCiAvKiBDbG9ja3NvdXJjZSBo
YW5kbGluZyAqLwotc3RhdGljIHZvaWQgZXh5bm9zNF9tY3RfZnJjX3N0YXJ0KHUzMiBoaSwgdTMy
IGxvKQotewotCXUzMiByZWc7Ci0KLQlleHlub3M0X21jdF93cml0ZShsbywgRVhZTk9TNF9NQ1Rf
R19DTlRfTCk7Ci0JZXh5bm9zNF9tY3Rfd3JpdGUoaGksIEVYWU5PUzRfTUNUX0dfQ05UX1UpOwot
Ci0JcmVnID0gX19yYXdfcmVhZGwocmVnX2Jhc2UgKyBFWFlOT1M0X01DVF9HX1RDT04pOwotCXJl
ZyB8PSBNQ1RfR19UQ09OX1NUQVJUOwotCWV4eW5vczRfbWN0X3dyaXRlKHJlZywgRVhZTk9TNF9N
Q1RfR19UQ09OKTsKLX0KLQogc3RhdGljIG5vdHJhY2UgdTMyIGV4eW5vczRfcmVhZF9zY2hlZF9j
bG9jayh2b2lkKQogewotCXJldHVybiBfX3Jhd19yZWFkbChyZWdfYmFzZSArIEVYWU5PUzRfTUNU
X0dfQ05UX0wpOworCXJldHVybiBfX3Jhd19yZWFkbChyZWdfYmFzZSArIEVYWU5PUzRfTUNUX0df
Q05UX0wpIC0KKwkJKGV4eW5vc19tY3Rfb2Zmc2V0ICYgMHhmZmZmZmZmZik7CiB9CiAKLXN0YXRp
YyBjeWNsZV90IGV4eW5vczRfZnJjX3JlYWQoc3RydWN0IGNsb2Nrc291cmNlICpjcykKK3N0YXRp
YyBjeWNsZV90IF9leHlub3M0X2ZyY19yZWFkKHZvaWQpCiB7CiAJdTMyIGxvLCBoaTsKIAlzdGF0
aWMgdTMyIF9fc3VzcGVuZF92b2xhdGlsZV9ic3MgaGkyOwpAQCAtMjA3LDkgKzE5NywyNSBAQCBz
dGF0aWMgY3ljbGVfdCBleHlub3M0X2ZyY19yZWFkKHN0cnVjdCBjbG9ja3NvdXJjZSAqY3MpCiAJ
cmV0dXJuICgoY3ljbGVfdCloaSA8PCAzMikgfCBsbzsKIH0KIAorc3RhdGljIGN5Y2xlX3QgZXh5
bm9zNF9mcmNfcmVhZChzdHJ1Y3QgY2xvY2tzb3VyY2UgKmNzKQoreworCXJldHVybiBfZXh5bm9z
NF9mcmNfcmVhZCgpIC0gZXh5bm9zX21jdF9vZmZzZXQ7Cit9CisKK3N0YXRpYyB2b2lkIGV4eW5v
czRfbWN0X2ZyY19zdGFydCh2b2lkKQoreworCXUzMiByZWc7CisKKwlleHlub3NfbWN0X29mZnNl
dCA9IF9leHlub3M0X2ZyY19yZWFkKCk7CisKKwlyZWcgPSBfX3Jhd19yZWFkbChyZWdfYmFzZSAr
IEVYWU5PUzRfTUNUX0dfVENPTik7CisJcmVnIHw9IE1DVF9HX1RDT05fU1RBUlQ7CisJZXh5bm9z
NF9tY3Rfd3JpdGUocmVnLCBFWFlOT1M0X01DVF9HX1RDT04pOworfQorCiBzdGF0aWMgdm9pZCBl
eHlub3M0X2ZyY19yZXN1bWUodm9pZCkKIHsKLQlleHlub3M0X21jdF9mcmNfc3RhcnQoMCwgMCk7
CisJZXh5bm9zNF9tY3RfZnJjX3N0YXJ0KCk7CiB9CiAKIHN0cnVjdCBjbG9ja3NvdXJjZSBtY3Rf
ZnJjID0gewpAQCAtMjI2LDEyICsyMzIsMTIgQEAgc3RydWN0IHN5c2NvcmVfb3BzIG1jdF9mcmNf
Y29yZSA9IHsKIAogc3RhdGljIHZvaWQgX19pbml0IGV4eW5vczRfY2xvY2tzb3VyY2VfaW5pdCh2
b2lkKQogewotCXU2NCBpbml0aWFsX3RpbWUgPSBleHlub3M0X2ZyY19yZWFkKCZtY3RfZnJjKTsK
Kwl1NjQgaW5pdGlhbF90aW1lID0gX2V4eW5vczRfZnJjX3JlYWQoKTsKIAogCWRvX2Rpdihpbml0
aWFsX3RpbWUsIChjbGtfcmF0ZSAvIDEwMDAwMDApKTsKIAlwcmludGsoS0VSTl9JTkZPICJJbml0
aWFsIHVzZWMgdGltZXIgJWxsdVxuIiwgaW5pdGlhbF90aW1lKTsKIAotCWV4eW5vczRfbWN0X2Zy
Y19zdGFydCgwLCAwKTsKKwlleHlub3M0X21jdF9mcmNfc3RhcnQoKTsKIAogCWlmIChjbG9ja3Nv
dXJjZV9yZWdpc3Rlcl9oeigmbWN0X2ZyYywgY2xrX3JhdGUpKQogCQlwYW5pYygiJXM6IGNhbid0
IHJlZ2lzdGVyIGNsb2Nrc291cmNlXG4iLCBtY3RfZnJjLm5hbWUpOwpAQCAtMjY3LDcgKzI3Myw3
IEBAIHN0YXRpYyB2b2lkIGV4eW5vczRfbWN0X2NvbXAwX3N0YXJ0KGVudW0gY2xvY2tfZXZlbnRf
bW9kZSBtb2RlLAogCQlleHlub3M0X21jdF93cml0ZShjeWNsZXMsIEVYWU5PUzRfTUNUX0dfQ09N
UDBfQUREX0lOQ1IpOwogCX0KIAotCWNvbXBfY3ljbGUgPSBleHlub3M0X2ZyY19yZWFkKCZtY3Rf
ZnJjKSArIGN5Y2xlczsKKwljb21wX2N5Y2xlID0gX2V4eW5vczRfZnJjX3JlYWQoKSArIGN5Y2xl
czsKIAlleHlub3M0X21jdF93cml0ZSgodTMyKWNvbXBfY3ljbGUsIEVYWU5PUzRfTUNUX0dfQ09N
UDBfTCk7CiAJZXh5bm9zNF9tY3Rfd3JpdGUoKHUzMikoY29tcF9jeWNsZSA+PiAzMiksIEVYWU5P
UzRfTUNUX0dfQ09NUDBfVSk7CiAKLS0gCjEuOS4xLjQyMy5nNDU5NmUzYQoK
--001a1133194a319cae04f9ed3e8a--
