From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 1/2] drm/exynos: fix null pointer dereference issue
Date: Thu, 20 Nov 2014 21:12:19 -0200
Message-ID: <20141120231219.GA3123@joana>
References: <1415865009-15979-1-git-send-email-inki.dae@samsung.com>
 <1415865009-15979-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1415865009-15979-2-git-send-email-inki.dae@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Inki Dae <inki.dae@samsung.com>
Cc: a.hajda@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNC0xMS0xMyBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+OgoKPiBUaGlzIHBhdGNo
IGZpeGVzIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBpc3N1ZSBpbmN1cnJlZAo+IHdoZW4gaXBw
IGRyaXZlciBpcyBlbmFibGVkIGFuZCBFeHlub3MgZHJtIGRyaXZlciBpcyBjbG9zZWQuCj4gCj4g
Tm9uIGttcyBkcml2ZXIgc2hvdWxkIHJlZ2lzdGVyIGl0cyBvd24gc3ViIGRyaXZlciB0byBzZXR1
cCBuZWNlc3NhcnkKPiByZXNvdXJjZXMsIHdoaWNoIGlzIGRvbmUgYnkgbG9hZCgpLiBTbyBudWxs
IHBvaW50ZXIgZGVyZWZlcmVuY2UKPiBvY2N1cnMgd2hlbiBpcHAgZHJpdmVyIGlzIGVuYWJsZWQg
YW5kIEV4eW5vcyBkcm0gZHJpdmVyIGlzIGNsb3NlZAo+IGJlY2F1c2UgaXBwIGNvcmUgZGV2aWNl
IGlzIHJlZ2lzdGVyZWQgYWZ0ZXIgY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRjaAo+IGNh
bGwuCj4gCj4gVGhpcyBwYXRjaCBtYWtlcyBleHlub3NfZHJtX2RldmljZV9zdWJkcnZfcHJvYmUo
KSB0byBiZSBjYWxsZWQgYWZ0ZXIgYWxsIG5vbgo+IGttcyBkcml2ZXJzIGFyZSByZWdpc3RlcmVk
LgoKVGhpcyBwYXRjaCBpcyBicmVha2luZyBleHlub3MgaW5pdGlhbGl6YXRpb24sIGV4eW5vc19k
cm1fZGV2aWNlX3N1YmRydl9wcm9iZSgpCm5lZWRzIHRoZSBkcnZkYXRhIGJ1dCBpdCBpcyBzdGls
bCBOVUxMIGF0IHRoaXMgcG9pbnQgd2hpY2ggbWFrZSB0aGUgd2hvbGUKZXh5bm9zIGluaXQgZmFp
bHMuIFRoZSBkcnZkYXRhIGlzIG9ubHkgc2V0IGluIGV4eW5vc19kcm1fbG9hZCgpIHNvIHdlIG5l
ZWQKY2FsbCBleHlub3NfZHJtX2RldmljZV9zdWJkcnZfcHJvYmUoKSBhZnRlciB0aGF0LgoKRG8g
eW91IGhhdmUgdGhlIGNyYXNoIG91dHB1dCBmb3IgdGhpcz8gV2hhdCBpcyB0aGUgaXNzdWUgeW91
IGFyZSBmaXhpbmc/ClVzdWFsbHkgeW91IHNob3VsZCBhZGQgdGhpcyBraW5kIG9mIGluZm9ybWF0
aW9uIHRvIHlvdSBjb21taXQgbWVzc2FnZSwgaXQKaGVscHMgdXMgdW5kZXJzdGFuZCB3aGF0IHlv
dSBhcmUgZml4aW5nLCBzcGVjaWFsbHkgaW4gY2FzZXMgd2hlbiBhIHJlZ3Jlc3Npb24KaXMgaW50
cm9kdWNlZCwgbGlrZSB0aGlzIHBhdGNoIGZvciBleGFtcGxlCgoJR3VzdGF2bwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
