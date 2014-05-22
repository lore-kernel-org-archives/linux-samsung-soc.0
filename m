From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 04/18] video: add command mode and command mode display
 timing
Date: Thu, 22 May 2014 22:07:50 +0900
Message-ID: <537DF6A6.1080804@samsung.com>
References: <1400647390-26590-1-git-send-email-yj44.cho@samsung.com>
 <1400647390-26590-5-git-send-email-yj44.cho@samsung.com>
 <20140521110204.GB2014@ulmo> <537C90F3.7050404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <537C90F3.7050404@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, robh+dt@kernel.org, a.hajda@samsung.com, kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org, galak@codeaurora.org, kgene.kim@samsung.com, s.trumtrar@pengutronix.de, laurent.pinchart@ideasonboard.com
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwNeyblCAyMeydvCAyMDo0MSwgWW91bmdKdW4gQ2hvIHdyb3RlOgo+IEhpIFRo
ZXJyeQo+IAo+IE9uIDA1LzIxLzIwMTQgMDg6MDIgUE0sIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+
PiBPbiBXZWQsIE1heSAyMSwgMjAxNCBhdCAwMTo0Mjo1NlBNICswOTAwLCBZb3VuZ0p1biBDaG8g
d3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uIHZpZGVvbW9kZSBhbmQgZGlzcGxheV90
aW1pbmcgcmVsZXZhbnQgY29kZXMuCj4+PiBUbyBzdXBwb3J0IGNvbW1hbmQgbW9kZSBwYW5lbCwg
aXQgZG9lcyBub3QgbmVlZCB0byBndWlkZSBpdHMgdGltaW5nCj4+PiBpbmZvcm1hdGlvbiB0byB0
aGUgZGlzcGxheSBjb250cm9sbGVyIGxpa2UgdmlkZW8gbW9kZSBwYW5lbCwKPj4+IGJ1dCBpdCBy
ZXF1aXJlcyBzaWduYWwgdGltaW5ncyB0byB0cmFuc2ZlciB2aWRlbyBkYXRhLgo+Pj4gU28gdGhp
cyBwYXRjaCBhZGRzIGNtZG1vZGUgc3RydWN0LCBjbWRtb2RlX2Rpc3BsYXlfdGltaW5nIHN0cnVj
dCBhbmQKPj4+IHRoZSBhY2NvcmRpbmcgaGVscGVyIGZ1bmN0aW9ucyB0byBjb252ZXJ0IGNtZG1v
ZGVfZGlzcGxheV90aW1pbmcKPj4+IHRvIGEgZ2VuZXJpYyBjbWRtb2RlLgo+Pgo+PiBDYW4geW91
IHBvaW50IG1lIHRvIHJlbGV2YW50IGRvY3VtZW50YXRpb24/IEkgd2Fzbid0IGFibGUgdG8gZmlu
ZCBpdCBieQo+PiBhIHF1aWNrIHNjYW4gdGhyb3VnaCB0aGUgRFNJIHNwZWNpZmljYXRpb24uCj4+
Cj4gCj4gSSdtIHNvcnJ5IHRvIHNheSB0aGF0IHRoZXJlIGlzIG5vIHNwZWNpZmljIG9uZSBkb2N1
bWVudC4KPiAKPiBJIHJlZmVycmVkIHRvIHNldmVyYWwgb25lcywgQ1BVIGludGVyZmFjZSwgSTgw
IGludGVyZmFjZSBhbmQKPiBEQkkgZG9jdW1lbnQobGFzdCB0aW1lIHlvdSBzYWlkIGl0KS4KPiBJ
IHRoaW5rIHRoaXMgaXMgZ29vZCB0byBjaGVjayBpdC4KPiBbIGh0dHA6Ly9jYWNoZS5mcmVlc2Nh
bGUuY29tL2ZpbGVzL2RzcC9kb2MvYXBwX25vdGUvQU40MTgwLnBkZiBdCj4gCgpQaW5nfi4gSXMg
dGhlcmUgb3RoZXIgY29tbWVudD8gSWYgc28gdGhlbiBJJ2QgbGlrZSB0byBwaWNrIHRoZW0gdXAu
IFdlCndvdWxkIGJlIGhhcHB5IGZvciB5b3UgbGVhdmUgcmV2aWV3ZWQtYnkgb3IgYWNrZWQtYnku
CgpUaGFua3MsCklua2kgRGFlCgo+IEFuZCBJIGFza2VkIHBhbmVsIHZlbmRvciBjdXN0b20gc2Vy
dmljZSBjZW50cmUgYWxzby4KPiAKPiBUaGFuayB5b3UuCj4gQmVzdCByZWdhcmRzIFlKCj4gCj4+
IFRoaWVycnkKPj4KPiAKPiAtLSAKPiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2Vu
ZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgZGV2aWNldHJlZSIgaW4KPiB0aGUgYm9keSBvZiBhIG1l
c3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwo+IE1vcmUgbWFqb3Jkb21vIGluZm8g
YXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
