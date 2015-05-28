From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/9] mm: Provide new get_vaddr_frames() helper
Date: Thu, 28 May 2015 16:24:02 -0700
Message-ID: <20150528162402.19a0a26a5b9eae36aa8050e5@linux-foundation.org>
References: <1431522495-4692-1-git-send-email-jack@suse.cz>
 <1431522495-4692-3-git-send-email-jack@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1431522495-4692-3-git-send-email-jack@suse.cz>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jan Kara <jack@suse.cz>
Cc: linux-samsung-soc@vger.kernel.org, Pawel Osciak <pawel@osciak.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, mgorman@suse.de, Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

T24gV2VkLCAxMyBNYXkgMjAxNSAxNTowODowOCArMDIwMCBKYW4gS2FyYSA8amFja0BzdXNlLmN6
PiB3cm90ZToKCj4gUHJvdmlkZSBuZXcgZnVuY3Rpb24gZ2V0X3ZhZGRyX2ZyYW1lcygpLiAgVGhp
cyBmdW5jdGlvbiBtYXBzIHZpcnR1YWwKPiBhZGRyZXNzZXMgZnJvbSBnaXZlbiBzdGFydCBhbmQg
ZmlsbHMgZ2l2ZW4gYXJyYXkgd2l0aCBwYWdlIGZyYW1lIG51bWJlcnMgb2YKPiB0aGUgY29ycmVz
cG9uZGluZyBwYWdlcy4gSWYgZ2l2ZW4gc3RhcnQgYmVsb25ncyB0byBhIG5vcm1hbCB2bWEsIHRo
ZSBmdW5jdGlvbgo+IGdyYWJzIHJlZmVyZW5jZSB0byBlYWNoIG9mIHRoZSBwYWdlcyB0byBwaW4g
dGhlbSBpbiBtZW1vcnkuIElmIHN0YXJ0Cj4gYmVsb25ncyB0byBWTV9JTyB8IFZNX1BGTk1BUCB2
bWEsIHdlIGRvbid0IHRvdWNoIHBhZ2Ugc3RydWN0dXJlcy4gQ2FsbGVyCj4gbXVzdCBtYWtlIHN1
cmUgcGZucyBhcmVuJ3QgcmV1c2VkIGZvciBhbnl0aGluZyBlbHNlIHdoaWxlIGhlIGlzIHVzaW5n
Cj4gdGhlbS4KPiAKPiBUaGlzIGZ1bmN0aW9uIGlzIGNyZWF0ZWQgZm9yIHZhcmlvdXMgZHJpdmVy
cyB0byBzaW1wbGlmeSBoYW5kbGluZyBvZgo+IHRoZWlyIGJ1ZmZlcnMuCj4gCj4gQWNrZWQtYnk6
IE1lbCBHb3JtYW4gPG1nb3JtYW5Ac3VzZS5kZT4KPiBBY2tlZC1ieTogVmxhc3RpbWlsIEJhYmth
IDx2YmFia2FAc3VzZS5jej4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6
Pgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmggfCAgNDQgKysrKysrKysrKysKPiAgbW0vZ3Vw
LmMgICAgICAgICAgIHwgMjI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCgpUaGF0J3MgYSBsdW1wIG9mIG5ldyBjb2RlIHdoaWNoIG1hbnkga2Vy
bmVscyB3b24ndCBiZSBuZWVkaW5nLiAgQ2FuIHdlCnB1dCBhbGwgdGhpcyBpbiBhIG5ldyAuYyBm
aWxlIGFuZCBzZWxlY3QgaXQgd2l0aGluIGRyaXZlcnMvbWVkaWEKS2NvbmZpZz8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
