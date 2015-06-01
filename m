From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 2/9] mm: Provide new get_vaddr_frames() helper
Date: Mon, 1 Jun 2015 14:40:17 +0200
Message-ID: <20150601124017.GC20288@quack.suse.cz>
References: <1431522495-4692-1-git-send-email-jack@suse.cz>
 <1431522495-4692-3-git-send-email-jack@suse.cz>
 <20150528162402.19a0a26a5b9eae36aa8050e5@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20150528162402.19a0a26a5b9eae36aa8050e5@linux-foundation.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, mgorman@suse.de, Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gVGh1IDI4LTA1LTE1IDE2OjI0OjAyLCBBbmRyZXcgTW9ydG9uIHdyb3RlOgo+IE9uIFdlZCwg
MTMgTWF5IDIwMTUgMTU6MDg6MDggKzAyMDAgSmFuIEthcmEgPGphY2tAc3VzZS5jej4gd3JvdGU6
Cj4gCj4gPiBQcm92aWRlIG5ldyBmdW5jdGlvbiBnZXRfdmFkZHJfZnJhbWVzKCkuICBUaGlzIGZ1
bmN0aW9uIG1hcHMgdmlydHVhbAo+ID4gYWRkcmVzc2VzIGZyb20gZ2l2ZW4gc3RhcnQgYW5kIGZp
bGxzIGdpdmVuIGFycmF5IHdpdGggcGFnZSBmcmFtZSBudW1iZXJzIG9mCj4gPiB0aGUgY29ycmVz
cG9uZGluZyBwYWdlcy4gSWYgZ2l2ZW4gc3RhcnQgYmVsb25ncyB0byBhIG5vcm1hbCB2bWEsIHRo
ZSBmdW5jdGlvbgo+ID4gZ3JhYnMgcmVmZXJlbmNlIHRvIGVhY2ggb2YgdGhlIHBhZ2VzIHRvIHBp
biB0aGVtIGluIG1lbW9yeS4gSWYgc3RhcnQKPiA+IGJlbG9uZ3MgdG8gVk1fSU8gfCBWTV9QRk5N
QVAgdm1hLCB3ZSBkb24ndCB0b3VjaCBwYWdlIHN0cnVjdHVyZXMuIENhbGxlcgo+ID4gbXVzdCBt
YWtlIHN1cmUgcGZucyBhcmVuJ3QgcmV1c2VkIGZvciBhbnl0aGluZyBlbHNlIHdoaWxlIGhlIGlz
IHVzaW5nCj4gPiB0aGVtLgo+ID4gCj4gPiBUaGlzIGZ1bmN0aW9uIGlzIGNyZWF0ZWQgZm9yIHZh
cmlvdXMgZHJpdmVycyB0byBzaW1wbGlmeSBoYW5kbGluZyBvZgo+ID4gdGhlaXIgYnVmZmVycy4K
PiA+IAo+ID4gQWNrZWQtYnk6IE1lbCBHb3JtYW4gPG1nb3JtYW5Ac3VzZS5kZT4KPiA+IEFja2Vk
LWJ5OiBWbGFzdGltaWwgQmFia2EgPHZiYWJrYUBzdXNlLmN6Pgo+ID4gU2lnbmVkLW9mZi1ieTog
SmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGludXgvbW0uaCB8
ICA0NCArKysrKysrKysrKwo+ID4gIG1tL2d1cC5jICAgICAgICAgICB8IDIyNiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+IAo+IFRoYXQncyBh
IGx1bXAgb2YgbmV3IGNvZGUgd2hpY2ggbWFueSBrZXJuZWxzIHdvbid0IGJlIG5lZWRpbmcuICBD
YW4gd2UKPiBwdXQgYWxsIHRoaXMgaW4gYSBuZXcgLmMgZmlsZSBhbmQgc2VsZWN0IGl0IHdpdGhp
biBkcml2ZXJzL21lZGlhCj4gS2NvbmZpZz8KICBZZWFoLCBtYWtlcyBzZW5zZS4gSSdsbCB3cml0
ZSBhIHBhdGNoLiBIYW5zLCBpcyBpdCBPSyB3aXRoIHlvdSBpZiBJCmp1c3QgY3JlYXRlIGEgcGF0
Y2ggb24gdG9wIG9mIHRoZSBzZXJpZXMgeW91IGhhdmUgaW4geW91ciB0cmVlPwoKCQkJCQkJCQlI
b256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jej4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
