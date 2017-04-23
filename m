From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: s3c24xx: Use devm_kcalloc() in s3c24xx_dma_probe()
Date: Sun, 23 Apr 2017 13:10:16 +0200
Message-ID: <b89bfd5c-315a-345f-7239-2d6300cf1f6e@users.sourceforge.net>
References: <930f0a6c-bc5c-3d01-6814-563780fc90ef@users.sourceforge.net>
 <9c10b823-f49b-8c73-2bf8-0fd2b0ba0231@users.sourceforge.net>
 <f1257887-ca14-6415-b1ff-d57190a1810f@math.uni-bielefeld.de>
 <02134825-fec7-73d7-2eb6-b510eaaf3b08@users.sourceforge.net>
 <49f1c0b2-7463-2121-1aed-0998f6635c92@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <49f1c0b2-7463-2121-1aed-0998f6635c92@math.uni-bielefeld.de>
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

Pj4gV0FSTklORzogUHJlZmVyIGRldm1fa2NhbGxvYyBvdmVyIGRldm1fa3phbGxvYyB3aXRoIG11
bHRpcGx5Cj4gRm9yIGV4YW1wbGUuIEFsc28gSSBqdXN0IG5vdGljZWQgc29tZSBwcmV2aW91cyBj
b21tZW50IGJ5IEtyenlzenRvZiB0aGF0Cj4gcG9pbnRlZCB0aGF0IG91dCBhbHJlYWR5Lgo+IAo+
IE15IHN1Z2dlc3Rpb246IE9uZSBzZW50ZW5jZSBkZXNjcmliaW5nIHRoYXQgdGhlIGN1cnJlbnQg
c2l0dWF0aW9uIGlzLgoKV2h5IGRvIHlvdSBmaW5kIHRoZSBzZW50ZW5jZSBmb3IgdGhlIG11bHRp
cGxpY2F0aW9uIGluZm9ybWF0aW9uIGluYXBwcm9wcmlhdGUKKG9yIGluY29tcGxldGUpIGF0IHRo
ZSBtb21lbnQ/CgoKPiBBbm90aGVyIHNlbnRlbmNlIGV4cGxhaW5pbmcgd2h5IHRoaXMgaXMgYmFk
L3VuZGVzaXJhYmxlLgoKV2hpY2ggZGV0YWlscyBkbyB5b3UgbWlzcyBoZXJlPwoKCj4gSW4gdGhp
cyBjYXNlLCB0aGUgb3V0cHV0IG9mIHRoZSBjaGVja3BhdGNoIHNjcmlwdCB3b3VsZCBjb21lIGlu
IGhhbmR5LgoKSXRzIGltcGxlbWVudGF0aW9uIG9mIHRoZSBjaGVjayDigJxBTExPQ19XSVRIX01V
TFRJUExZ4oCdIGNvbnNpZGVycyBvbmx5IGFuIG90aGVyCnNlYXJjaCBwYXR0ZXJuIHNvIGZhci4K
CiogRG8geW91IGZpbmQgaXQgd29ydGh3aGlsZSB0byBhZGQgYSBwcmVmaXggbGlrZSDigJxkZXZt
X+KAnSB0byB0aGUgdXNlZAogIHJlZ3VsYXIgZXhwcmVzc2lvbj8KCiogV291bGQgbGlrZSB0byBp
bXByb3ZlIGFueSByZWxhdGVkIHNjcmlwdHMgZm9yIHRoZSBzZW1hbnRpYyBwYXRjaCBsYW5ndWFn
ZQogIChDb2NjaW5lbGxlIHNvZnR3YXJlKSBhIGJpdCBtb3JlPwoKCj4gV2l0aCB0aGlzLCB5b3Ug
YXZvaWQgY3JhbW1pbmcgZXZlcnkgaW5mb3JtYXRpb24gaW50byBvbmUgbG9uZyBhbmQKPiBjb21w
bGljYXRlZCBzZW50ZW5jZS4KClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayBhYm91dCBvdGhlciB3
b3JkaW5nIHByZWZlcmVuY2VzLgoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCg==
