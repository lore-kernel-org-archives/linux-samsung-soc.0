From: Seungwhan Youn <claude.youn@gmail.com>
Subject: Re: [PATCH 10/10] ASoC: SAMSUNG: Add Machine driver
 for S/PDIF PCM audio
Date: Tue, 5 Oct 2010 16:39:11 +0900
Message-ID: <AANLkTin4skx+aiL2FXwWO1ekKqT2YWDd3SM1H5WnGkhC@mail.gmail.com>
References: <1286191550-22197-1-git-send-email-sw.youn@samsung.com>
	<1286194583-19937-1-git-send-email-sw.youn@samsung.com>
	<20101004224159.GA4972@opensource.wolfsonmicro.com>
	<AANLkTi=FHGw+qzL507K546vr8zEZgXBP3Mk=O__Rpd4H@mail.gmail.com>
	<AANLkTincwL_nQAmu7Dcmht0FV43BiN7OoecE_60QJhS2@mail.gmail.com>
	<20101005044304.GA26509@opensource.wolfsonmicro.com>
	<AANLkTi=x_fi5HTBBmMUv8YTxSdbgcnJ=ZbacJQj6rcgf@mail.gmail.com>
	<20101005055937.GA19989@opensource.wolfsonmicro.com>
	<AANLkTimi1t5S2XWdUFzaPttD4Hywm0SLt5CvR1YnVOjj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <AANLkTimi1t5S2XWdUFzaPttD4Hywm0SLt5CvR1YnVOjj@mail.gmail.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: alsa-devel@alsa-project.org, kgene.kim@samsung.com, jassi.brar@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, lrg@slimlogic.co.uk, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Pj4+IEkgaG9wZSB5b3Ugbm90aWNlZCB0aGF0IHRoaXMgY2xvY2sgaGllcmFyY2h5IGlzIGEgX3Zl
cnlfIGJvYXJkIHNwZWNpZmljIHRoaW5nLgo+Pj4gV2UgY2FuIGVhc2lseSBwbGFjZSBTb0NzJyBz
aGFyZWQgc3R1ZmYgaW4gYXJjaC9hcm0vcGxhdC1zYW1zdW5nIChvciBzaW1pbGFyKQo+Pj4gQW55
IHN1Z2dlc3Rpb25zLCB3aGVyZSBkbyB3ZSBwbGFjZSBjb2RlIHNoYXJlZCBieSBTTURLLWJvYXJk
cyA/Cj4+Cj4+IHBsYXQtc2Ftc3VuZyB3b3VsZCBwcm9iYWJseSBiZSBmaW5lIGZvciB0aGF0IGFs
c28gLSBjcmVhdGUgYSBmaWxlIGNhbGxlZAo+PiBjb21tb24tc21kayBvciBzb21ldGhpbmcuIMKg
U29tZSBvdGhlciB0aGluZ3MgaGF2ZSBnb25lIGZvciBhIHBsYXQtc21kawo+PiBzdHlsZSBhcHBy
b2FjaCB0b28sIHRob3VnaCBJJ20gbm90IHN1cmUgaG93IHRhc3RlZnVsIEkgZmluZCB0aGF0Cj4+
IHBlcnNvbmFsbHkuCj4gRXZlbiB0aG91Z2ggSSB3b3VsZCBwZXJzb25hbGx5IGxpa2UgdG8gaGF2
ZSBFUExMIGNvbnRyb2wgZm9yIGEgZGV2aWNlCj4gaW4gbWFjaGluZSBzcGVjaWZpYyBtYW5uZXIg
YXMgcGFydCBvZiBpdHMgZHJpdmVyLCBJIGFjY2VwdCB5b3VyIG9waW5pb24uCj4KPiBDbGF1ZGUs
IGxldCB1cyBjcmVhdGUgb25lIGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9zbWRrLmMgdG8gZG8gY29t
bW9uCj4gc3R1ZmYgZm9yIFNNS0RzIGxpa2UgRVBMTCBjb250cm9sLiBXaGF0IGRvIHlvdSB0aGlu
ayA/CgpBY3R1YWxseSBpZiB3ZSBhZGQgdGhpcyBmaWxlIG9uIHBsYXQtc2Ftc3VuZywgYm9hcmQt
aW5pdCB3aWxsIGJlCnNlcGFyYXRlZCB0d28tcGFydCwgb25lIGlzIG1hY2hpbmUoYm9hcmQpIHNw
ZWNpZmljIGFuZCBvdGhlciBpcyBhbGwKc21kayBzcGVjaWZpYy4gU28sIElmIGl0IGRvZXNuJ3Qg
bWFrZSBjb25mdXNpb24gdG8gb3RoZXIgZ3V5cyB3aG8Kd2FudHMgdG8gYWRkIHNldHRpbmdzIGZv
ciB0aGVpciBmZWF0dXJlcyBvbiBib2FyZC1pbml0LCBpdCBsb29rcyBnb29kCnRvIG1lLiBCdXQg
SSB0aGluayB0aGF0IHdlIGFsc28gaGF2ZSB0byBsaXN0ZW4gTXIuIEJlbiBEb29rcyBhbmQgTXIu
Ckt1a2ppbiBLaW0ncyBvcGluaW9uIGFib3V0IHRoaXMgYmVmb3JlIHdlIGdldCBhIGNvbmNsdXNp
b24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwOi8vbWFp
bG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
