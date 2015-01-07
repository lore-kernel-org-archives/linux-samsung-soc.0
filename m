From: Anand Moon <moon.linux@yahoo.com>
Subject: Re: [PATCH v2] ARM: exynos_defconfig: Enable CONFIG_LOCKUP_DETECTOR
Date: Wed, 7 Jan 2015 13:56:36 +0000 (UTC)
Message-ID: <157605903.5809859.1420638996780.JavaMail.yahoo@jws10677.mail.bf1.yahoo.com>
References: <1420635542-7202-1-git-send-email-moon.linux@yahoo.com>
 <1420637261.32552.4.camel@AMDC1943>
Reply-To: Anand Moon <moon.linux@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420637261.32552.4.camel@AMDC1943>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kevin Hilman <khilman@linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgS3N6eXN6dG9mIEtvemxvd3NraSwKCkkgcGlja2VkIHVwIHRoZSBiZWxsb3cgbGluZSBmcm9t
IAoKCkRvY3VtZW50YXRpb24vbG9ja2luZy9sb2NrZGVwLWRlc2lnbi50eHQgIGxpbmUgbm8gMTgK
CkkgdW5kZXJzdGFuZCB0aGF0IGJ5IGVuYWJsaW5nIHRoaXMgZmxhZyB3ZSBjb3VsZCBkZXRlY3Qg
cG9zc2libGUgCgpkZWFkbG9jayBzaXR1YXRpb24gd2l0aCB0aGUga2VybmVsLiBTb3JyeSBmb3Ig
dGhlIG5vaXNlLgoKCi1BbmFuZCBNb29uCgoKCk9uIFdlZG5lc2RheSwgSmFudWFyeSA3LCAyMDE1
IDY6NTcgUE0sIEtyenlzenRvZiBLb3psb3dza2kgPGsua296bG93c2tpQHNhbXN1bmcuY29tPiB3
cm90ZToKT24gxZtybywgMjAxNS0wMS0wNyBhdCAxODoyOSArMDUzMCwgQW5hbmQgTW9vbiB3cm90
ZToKPiBFbmFibGUgQ09ORklHX0xPQ0tVUF9ERVRFQ1RPUiB0byB2YWxpZGF0ZSBrZXJuZWwgbG9j
a3Mgc3RhdGUgZm9yIGV4eW5vcyBTT0MuCj4gCj4gRW5hYmxpbmcgQ09ORklHX0xPQ0tVUF9ERVRF
Q1RPUiBoZWxwIHZhbGlkYXRvciB0cmFja3MgdGhlICdzdGF0ZScgb2YgbG9jay1jbGFzc2VzLAo+
IGFuZCBpdCB0cmFja3MgZGVwZW5kZW5jaWVzIGJldHdlZW4gZGlmZmVyZW50IGxvY2stY2xhc3Nl
cy4KPiBUaGUgdmFsaWRhdG9yIG1haW50YWlucyBhIHJvbGxpbmcgcHJvb2YgdGhhdCB0aGUgc3Rh
dGUgYW5kCj4gdGhlIGRlcGVuZGVuY2llcyBhcmUgY29ycmVjdC4KClVuZm9ydHVuYXRlbHkgdGhp
cyBpcyBub3QgY29ycmVjdC4gTG9ja3VwIGRldGVjdG9yIGRvZXMgc29tZXRoaW5nIGVsc2UuClBs
ZWFzZSByZWFkIHRoZSBoZWxwL21hbnVhbCBmb3IgTE9DS1VQX0RFVEVDVE9SLiBZb3UgY2FuIGZp
bmQgaW4KbGliL0tjb25maWcuZGVidWcgKGFyb3VuZCBsaW5lIDY2NykuCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKPiAKPiBDaGFuZ2VzIHNpbmNlIHYyOgo+ICAqIE1hZGUgY29tbWl0IG1lc3Nh
Z2UgbW9yZSBjbGVhcgo+ICAqIENvcnJlY3RlZCBncmFtbWVyIGluIGNvZGUgY29tbWVudAo+IAo+
IFRlc3RlZCBvbiBFeHlub3M1NDIyIE9EUk9JRCBYVTMgYm9hcmQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5hbmQgTW9vbiA8bW9vbi5saW51eEB5YWhvby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEtyenlz
enRvZiBLb3psb3dza2kgPGsua296bG93c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBhcmNoL2Fy
bS9jb25maWdzL2V4eW5vc19kZWZjb25maWcgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvZXh5bm9zX2RlZmNv
bmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvZXh5bm9zX2RlZmNvbmZpZwo+IGluZGV4IDVlZjE0ZGUu
LmVjZDk5ODcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9leHlub3NfZGVmY29uZmln
Cj4gKysrIGIvYXJjaC9hcm0vY29uZmlncy9leHlub3NfZGVmY29uZmlnCj4gQEAgLTE3OCw2ICsx
NzgsNyBAQCBDT05GSUdfUFJJTlRLX1RJTUU9eQo+ICBDT05GSUdfREVCVUdfRlM9eQo+ICBDT05G
SUdfTUFHSUNfU1lTUlE9eQo+ICBDT05GSUdfREVCVUdfS0VSTkVMPXkKPiArQ09ORklHX0xPQ0tV
UF9ERVRFQ1RPUj15Cj4gIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLPXkKPiAgQ09ORklHX0RFQlVH
X1JUX01VVEVYRVM9eQo+ICBDT05GSUdfREVCVUdfU1BJTkxPQ0s9eQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5n
IGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
