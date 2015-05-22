From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH 0/5] drm/exynos: rework layer blending setup
Date: Fri, 22 May 2015 18:13:03 +0900
Message-ID: <555EF31F.2080504@samsung.com>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <555E43B5.2000000@math.uni-bielefeld.de> <555EAAE1.9030406@samsung.com>
 <b64b1d76e98e038c5b57355c06e31fdb@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <b64b1d76e98e038c5b57355c06e31fdb@math.uni-bielefeld.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, gustavo.padovan@collabora.co.uk, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzLAoKT24gMDUvMjIvMjAxNSAwNTowNyBQTSwgVG9iaWFzIEpha29iaSB3cm90ZToK
PiBIZWxsbyBKb29ueW91bmcsCj4gCj4gT24gMjAxNS0wNS0yMiAwNjowNCwgSm9vbnlvdW5nIFNo
aW0gd3JvdGU6Cj4+IEhpIFRvYmlhcywKPj4KPj4gT24gMDUvMjIvMjAxNSAwNTo0NCBBTSwgVG9i
aWFzIEpha29iaSB3cm90ZToKPj4+IEdlbnRsZSByZW1pbmRlciB0aGF0IEkgc3RpbGwgaGF2ZW4n
dCBoZWFyZCBhbnl0aGluZyBhYm91dCB0aGUgc2VyaWVzIGJ5Cj4+PiB0aGUgU2Ftc3VuZyBndXlz
IDspCj4+Pgo+Pgo+PiBTb3JyeSBmb3IgbGF0ZSwgaSdtIGJ1c3kgYW5kIGkgdGhpbmsgd2hldGhl
ciBpdCdzIHBvc3NpYmxlIGFueSB3YXkgZm9yCj4+IHRoaXMgYmxlbmRpbmcgZnJvbSBleHlub3Mg
ZHJtIGZyYW1ld29yayBhZnRlciBhdG9taWMgZmVhdHVyZSBvZiBleHlub3MKPj4gbWVyZ2VkLgo+
IHRoZSBjb2RlIGlzIGxhcmdlbHkgaW5kZXBlbmRlbnQgb2YgR3VzdGF2bydzIHBhdGNoZXMuIEl0
IGRvZXNuJ3QgcmVhbGx5IG1ha2UgYSBsb3Qgb2YgZGlmZmVyZW5jZSBpZiBpdCdzIG1lcmdlZCBi
ZWZvcmUgb3IgYWZ0ZXIgYXRvbWljLiBJbiBmYWN0IEkndmUgYWxyZWFkeSB0ZXN0ZWQgaXQgd2l0
aCBhbmQgd2l0aG91dCBhdG9taWMuCj4gCj4gSWYgcG9zc2libGUgSSB3b3VsZCBsaWtlIHRoaXMg
dG8gYmUgbWVyZ2VkIG5vdywgc28gdGhhdCBpdCBjYW4gZ28gaW50byA0LjIuIEkgYWxzbyBoYXZl
IHRoZSBwYXRjaGVzIGZpeGluZyB0aGUgenBvcyBpc3N1ZSB3YWl0aW5nLCB3aGljaCBJJ20gcGxh
bm5pbmcgdG8gYmFzZSBvbiBHdXN0YXZvJ3MgbmV4dCBjbGVhbnVwIHNlcmllcy4gQnV0IGZvciB0
aGlzIGJvdGggdGhlIGF0b21pYyBhbmQgdGhlIGxheWVyIHdvcmsgc2VyaWVzIG5lZWQgdG8gZ2V0
IG1lcmdlZCBmaXJzdC4KPiAKClNvcnJ5IGZvciBub3QgZGV0YWlsZWQgcmV2aWV3LCBpIGRvbid0
IGtub3cgd2hhdCBpcyBJbmtpJ3Mgb3BpbmlvbiBidXQgaQpmZWVsIHRoZXkgbmVlZCB0byBiZSBp
bXByb3ZlZCBtb3JlLgoKUGxlYXNlIHJ1biAuL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBiZWZvcmUg
cG9zdGluZyBhbmQgY291bGQgeW91IHVzZSB3b3JkCndyYXA/IGl0J3MgdG9vIGxvbmcgc28gZGlm
ZmljdWx0IHRvIHJlYWQuCgpUaGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
