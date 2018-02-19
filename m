From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/8] clk: Add clk_bulk_alloc functions
Date: Mon, 19 Feb 2018 18:22:29 +0000
Message-ID: <CACvgo50-Cx_=yvbLD-osxHXnrdENHpwFBkrXT_jV4R9vJniTjw@mail.gmail.com>
References: <CGME20180219154456eucas1p15f4073beaf61312238f142f217a8bb3c@eucas1p1.samsung.com>
 <1519055046-2399-1-git-send-email-m.purski@samsung.com>
 <1519055046-2399-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1519055046-2399-2-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maciej Purski <m.purski@samsung.com>
Cc: David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Kamil Debski <kamil@wypas.org>, ML dri-devel <dri-devel@lists.freedesktop.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, Thibault Saunier <thibault.saunier@osg.samsung.com>, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-media@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LAKML <linux-arm-k>
List-Id: linux-samsung-soc@vger.kernel.org

SEkgTWFjaWVqLAoKSnVzdCBzaGFyaW5nIGEgY291cGxlIG9mIGZseS1ieSBpZGVhcyAtIHBsZWFz
ZSBkb24ndCByZWFkIHRvbyBtdWNoIGludG8gdGhlbS4KCk9uIDE5IEZlYnJ1YXJ5IDIwMTggYXQg
MTU6NDMsIE1hY2llaiBQdXJza2kgPG0ucHVyc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPiBXaGVu
IGEgZHJpdmVyIGlzIGdvaW5nIHRvIHVzZSBjbGtfYnVsa19nZXQoKSBmdW5jdGlvbiwgaXQgaGFz
IHRvCj4gaW5pdGlhbGl6ZSBhbiBhcnJheSBvZiBjbGtfYnVsa19kYXRhLCBieSBmaWxsaW5nIGl0
cyBpZCBmaWVsZHMuCj4KPiBBZGQgYSBuZXcgZnVuY3Rpb24gdG8gdGhlIGNvcmUsIHdoaWNoIGR5
bmFtaWNhbGx5IGFsbG9jYXRlcwo+IGNsa19idWxrX2RhdGEgYXJyYXkgYW5kIGZpbGxzIGl0cyBp
ZCBmaWVsZHMuIEFkZCBjbGtfYnVsa19mcmVlKCkKPiBmdW5jdGlvbiwgd2hpY2ggZnJlZXMgdGhl
IGFycmF5IGFsbG9jYXRlZCBieSBjbGtfYnVsa19hbGxvYygpIGZ1bmN0aW9uLgo+IEFkZCBhIG1h
bmFnZWQgdmVyc2lvbiBvZiBjbGtfYnVsa19hbGxvYygpLgo+Ck1vc3QgcGxhY2VzIHVzZSBhIHNt
YWxsIGZpeGVkIG51bWJlciBvZiBzdHJ1Y3QgY2xrIHBvaW50ZXJzLgpVc2luZyBkZXZyZXMgKyBr
YWxsb2MgdG8gYWxsb2NhdGUgMS00IHBvaW50ZXJzIGZlZWxzIGEgYml0IHN0cmFuZ2UuCgpRdWlj
ayBncmVwIHNob3dzIG92ZXIgMTUwIGluc3RhbmNlcyB0aGF0IGNvdWxkIGJlIHVwZGF0ZWQgdG8g
dXNlIHRoZSBuZXcgQVBJLgpBZGRpbmcgYSBjb2NjaSBzY3JpcHQgdG8gc2ltcGxpZnkgdGhlIHRy
YW5zaXRpb24gd291bGQgYmUgYSBnb29kIGlkZWEuCgo+IC0tLSBhL2luY2x1ZGUvbGludXgvY2xr
LmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2Nsay5oCj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAgI2lu
Y2x1ZGUgPGxpbnV4L2Vyci5oPgo+ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9ub3RpZmllci5oPgo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ClRoZSBl
eHRyYSBoZWFkZXIgZGVjbGFyYXRpb24gc2hvdWxkIG5vdCBiZSBuZWVkZWQuIE9uZSBzaG91bGQg
YmUgYWJsZQp0byBmb3J3YXJkIGRlY2xhcmUgYW55IHVuZGVmaW5lZCBzdHJ1Y3RzLgoKSFRICkVt
aWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
