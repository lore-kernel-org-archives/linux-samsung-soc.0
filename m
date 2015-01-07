From: Anand Moon <moon.linux@yahoo.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Enable CONFIG_LOCKUP_DETECTOR
Date: Wed, 7 Jan 2015 12:30:59 +0000 (UTC)
Message-ID: <800144515.5769004.1420633859663.JavaMail.yahoo@jws10601.mail.bf1.yahoo.com>
References: <1420632932-6964-1-git-send-email-moon.linux@yahoo.com>
 <1420633348.32552.2.camel@AMDC1943>
Reply-To: Anand Moon <moon.linux@yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420633348.32552.2.camel@AMDC1943>
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
Cc: Kevin Hilman <khilman@linaro.org>, Russell King <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Vivek Gautam <gautam.vivek@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tushar Behera <tushar.behera@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwKClRoYW5rcyBmb3IgcmV2aWV3CgpJIHdpbGwgc2VuZCBw
YXRjaCB2MiB3aXRoIHByb3BlciByZWFzb24uCgotQW5hbmQgTW9vbgoKCgpPbiBXZWRuZXNkYXks
IEphbnVhcnkgNywgMjAxNSA1OjUyIFBNLCBLcnp5c3p0b2YgS296bG93c2tpIDxrLmtvemxvd3Nr
aUBzYW1zdW5nLmNvbT4gd3JvdGU6Ck9uIMWbcm8sIDIwMTUtMDEtMDcgYXQgMTc6NDUgKzA1MzAs
IEFuYW5kIE1vb24gd3JvdGU6Cj4gQVJNIEVuYWJsZSBDT05GSUdfTE9DS1VQX0RFVEVDVE9SIHRv
IHZhbGlkYXRpb24gb2Yga2VybmVsIGxvY2tzCj4gCj4gdjIgRml4ZWQgdGhlIGNvbW1pdCBsb2cK
PiBUaGlzIGNvbmZpZyBpdGVtIGhlbHBzIGdldHRpbmcgc29tZSB1c2VmdWwgaW5mb3JtYXRpb24g
d2hlbiBsb2NrdXAKPiBoYXBwZW5zLiBJZiB5b3Ugd2FudCB0byB2YWxpZGF0ZSBsb2NrcyB0aGVu
IHByb2JhYmx5IHlvdSB3YW50Cj4gUFJPVkVfTE9DS0lORy4uLiBidXQgaXRzIG92ZXJoZWFkIGlz
IGxhcmdlci4KPiAKPiBBbnl3YXkgdGhlIG92ZXJoZWFkIG9mIExPQ0tVUF9ERVRFQ1RPUiBpcyBz
bWFsbCBhbmQgbXVsdGlfdjdfZGVmY29uZmlnCj4gaGFzIGl0IGVuYWJsZWQgc28gSSBndWVzcyBl
eHlub3MgbWF5IGRvIGl0IGFzIHdlbGwuCgpFcnI/IFdoeSBkaWQgeW91IGluY2x1ZGUgbXkgcmVz
cG9uc2UgYXMgY29tbWl0IG1lc3NhZ2U/IEl0IGRvZXMgbm90CnJlYWxseSBtYWtlIHNlbnNlLgoK
TGV0IG1lIHBvaW50IHRoaXMgb25jZSBhZ2FpbjoKMS4gVGhlIGNvbW1pdCBtZXNzYWdlIGlzIGlu
YWNjdXJhdGUgYmVjYXVzZSBDT05GSUdfTE9DS1VQX0RFVEVDVE9SIGRvZXMKbm90IHZhbGlkYXRl
IHRoZSBsb2Nrcy4KMi4gUGxlYXNlIHdyaXRlIHByb3BlciBjb21taXQgbWVzc2FnZSBkZXNjcmli
aW5nIFdIWSB5b3Ugd2FudCB0byBhZGQKdGhpcyBjb25maWcgb3B0aW9uLgoKQmVzdCByZWdhcmRz
LApLcnp5c3p0b2YKCj4gCj4gVGVzdGVkIG9uIEV4eW5vczU0MjIgT0RST0lEIFhVMyBib2FyZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxtb29uLmxpbnV4QHlhaG9vLmNvbT4KPiBS
ZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8ay5rb3psb3dza2lAc2Ftc3VuZy5jb20+
Cj4gLS0tCj4gIGFyY2gvYXJtL2NvbmZpZ3MvZXh5bm9zX2RlZmNvbmZpZyB8IDEgKwo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29u
Zmlncy9leHlub3NfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9leHlub3NfZGVmY29uZmln
Cj4gaW5kZXggNWVmMTRkZS4uZWNkOTk4NyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9jb25maWdz
L2V4eW5vc19kZWZjb25maWcKPiArKysgYi9hcmNoL2FybS9jb25maWdzL2V4eW5vc19kZWZjb25m
aWcKPiBAQCAtMTc4LDYgKzE3OCw3IEBAIENPTkZJR19QUklOVEtfVElNRT15Cj4gIENPTkZJR19E
RUJVR19GUz15Cj4gIENPTkZJR19NQUdJQ19TWVNSUT15Cj4gIENPTkZJR19ERUJVR19LRVJORUw9
eQo+ICtDT05GSUdfTE9DS1VQX0RFVEVDVE9SPXkKPiAgQ09ORklHX0RFVEVDVF9IVU5HX1RBU0s9
eQo+ICBDT05GSUdfREVCVUdfUlRfTVVURVhFUz15Cj4gIENPTkZJR19ERUJVR19TUElOTE9DSz15
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
cm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0t
a2VybmVsCg==
