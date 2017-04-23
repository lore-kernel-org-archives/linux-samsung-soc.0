From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: s3c24xx: Use devm_kcalloc() in s3c24xx_dma_probe()
Date: Sun, 23 Apr 2017 14:36:05 +0200
Message-ID: <947cea53-0373-f756-d73b-030c9b77e2d0@users.sourceforge.net>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
 <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
 <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
 <02134825-fec7-73d7-2eb6-b510eaaf3b08@users.sourceforge.net>
 <49f1c0b2-7463-2121-1aed-0998f6635c92@math.uni-bielefeld.de>
 <b89bfd5c-315a-345f-7239-2d6300cf1f6e@users.sourceforge.net>
 <bb42bc46-cb12-cd32-ecd9-ae9b991b476b@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bb42bc46-cb12-cd32-ecd9-ae9b991b476b@math.uni-bielefeld.de>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

Pj4gSXRzIGltcGxlbWVudGF0aW9uIG9mIHRoZSBjaGVjayDigJxBTExPQ19XSVRIX01VTFRJUExZ
4oCdIGNvbnNpZGVycyBvbmx5IGFuIG90aGVyCj4+IHNlYXJjaCBwYXR0ZXJuIHNvIGZhci4KPj4K
Pj4gKiBEbyB5b3UgZmluZCBpdCB3b3J0aHdoaWxlIHRvIGFkZCBhIHByZWZpeCBsaWtlIOKAnGRl
dm1f4oCdIHRvIHRoZSB1c2VkCj4+ICAgcmVndWxhciBleHByZXNzaW9uPwo+Pgo+PiAqIFdvdWxk
IGxpa2UgdG8gaW1wcm92ZSBhbnkgcmVsYXRlZCBzY3JpcHRzIGZvciB0aGUgc2VtYW50aWMgcGF0
Y2ggbGFuZ3VhZ2UKPj4gICAoQ29jY2luZWxsZSBzb2Z0d2FyZSkgYSBiaXQgbW9yZT8KPiBJIGRv
bid0IHVuZGVyc3RhbmQgd2h5IHlvdSdyZSBhc2tpbmcgdGhpcy4KClNvZnR3YXJlIGRldmVsb3Bl
cnMgYW5kIGNvZGUgcmV2aWV3ZXJzIGhhdmUgZ290IGRpZmZlcmVudCBvcGluaW9ucwphYm91dCBz
dWNoIGNoZWNrcyBhbmQgdGhlaXIgcmVsZXZhbmNlLgoKCj4gSSdtIHRhbGtpbmcgYWJvdXQgdGhl
IF9vdXRwdXRfIG9mIGNoZWNrcGF0Y2gsCgpUaGlzIGluZm9ybWF0aW9uIGlzIGNsZWFyIGF0IGZp
cnN0IGdsYW5jZS4KCgo+IG5vdCBhYm91dCB0aGUgc2NyaXB0IGl0c2VsZi4KCkJ1dCBpdCB3aWxs
IG5vdCBwcm92aWRlIHRoZSB3YXJuaW5nIHlvdSBtaWdodCBiZSBsb29raW5nIGZvcgp3aGlsZSB5
b3Ugc2VlbSB0byBmaW5kIG15IHNvdXJjZSBjb2RlIGFuYWx5c2lzIGFwcHJvYWNoIGFuZApub3Rp
ZmljYXRpb25zIGltcHJvdmFibGUuCkkgYXNzdW1lIHRoYXQgeW91IG1pZ2h0IGJlIGludGVyZXN0
ZWQgaW4gY29ycmVzcG9uZGluZyBleHRlbnNpb25zCmZvciB0aGUgaW52b2x2ZWQgc2VhcmNoIHBh
dHRlcm5zLgoKCj4gQnV0IHVuZG91YnRlZGx5IHlvdXIgcGF0Y2ggaXMgbW90aXZhdGVkIGJ5IHRo
ZSBvdXRwdXQgb2Ygc2FpZCB0b29sLgoKVGhpcyB0b29sIGltcGxlbWVudGVkIHNvbWUgY2hlY2tz
LgoKCj4gSGVuY2UgeW91IHNob3VsZCBtZW50aW9uIHRoYXQuCgpBZGRpdGlvbmFsIHRvb2xzIHRh
a2UgYWxzbyBjYXJlIGZvciBzaW1pbGFyIHNvZnR3YXJlIGRldmVsb3BtZW50IGNvbmNlcm5zLApk
b24ndCB0aGV5PwoKQ2FuIGl0IGJlIGFwcHJvcHJpYXRlIHRvIG9taXQgdGhlIHJlZmVyZW5jZSB0
byBvbmx5IG9uZSBQZXJsIHNjcmlwdApmb3IgcmVsYXRlZCB1c2UgY2FzZXM/CgpSZWdhcmRzLApN
YXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFybS1rZXJuZWwK
