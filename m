From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH v3 0/3] Add support for the S6E3HF2 panel on TM2e board
Date: Fri, 19 May 2017 15:56:25 +0900
Message-ID: <4b974579-eb2f-1258-86e3-21ffeb22589a@samsung.com>
References: <CGME20170418084047epcas5p493261a4cb9204e682f60cde8d659565c@epcas5p4.samsung.com>
 <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1492504836-19225-1-git-send-email-hoegeun.kwon@samsung.com>
Content-language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: thierry.reding@gmail.com, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, javier@osg.samsung.com, andi.shyti@samsung.com, Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

RGVhciBUaGllcnJ5LAoKQ291bGQgeW91IGNoZWNrIHRoZXNlIHBhdGNoZXM/CkkgdGhpbmsgdGhp
cyBwYXRjaGVzIGhhdmUgYWNjdW11bGF0ZWQgZW5vdWdoIGR1c3QuCklmIHlvdSBoYXZlIGEgYW5v
dGhlciBvcGluaW9uLCBwbGVhc2UgdGVsbCBtZS4KCkJlc3QgcmVnYXJkcywKSG9lZ2V1bgoKT24g
MDQvMTgvMjAxNyAwNTo0MCBQTSwgSG9lZ2V1biBLd29uIHdyb3RlOgo+IEhpIGFsbCwKPgo+IFRo
ZSBwdXJwb3NlIG9mIHRoaXMgcGF0Y2ggaXMgYWRkIHN1cHBvcnQgZm9yIHM2ZTNoZjIgQU1PTEVE
IHBhbmVsIG9uCj4gdGhlIFRNMmUgYm9hcmQuIFRoZSBwYW5lbCBoYXMgMTYwMHgyNTYwIHJlc29s
dXRpb24gaW4gNS42NSIgcGh5c2ljYWwKPiBwYW5lbCBpbiB0aGUgVE0yZSBkZXZpY2UuCj4KPiBU
aGUgczZlM2hmMiBwYW5lbCg1LjY1IikgaXMgc2ltbGlhciB0byB0aGUgcHJldmlvdXMgczZlM2hh
MiBwYW5lbCg1LjciKSwKPiBidXQgcmVzb2x1dGlvbiBhbmQgc29tZSBjb21tYW5kIG1lc3NhZ2Ug
YXJlIGRpZmZlcmVudC4gU28gaXQgY2FuIGJlCj4gZGlzdGluZ3Vpc2hlZCBhcyBhIGNvbXBhdGli
bGl0aXkgc3RyaW5nLgo+Cj4gQmVzdCByZWdhcmRzLAo+IEhvZWdldW4KPgo+IENoYW5nZXMgZm9y
IFYzOgo+IC0gUmVtb3ZlIHRlLWdwaW9zIHByb3BlcnR5IGluIGR0cy4KPiAtIEFkZGVkIFJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPiBvbiBhbGwgcGF0Y2hl
cy4KPiAtIEFkZGVkIFJldmlld2VkLWJ5OiBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+
IG9uIHBhdGNoICgyLzMpLgo+Cj4gQ2hhbmdlcyBmb3IgVjI6Cj4gLSBBZGQgbmV3IGNvbXBhdGli
bGUgc3RyaW5nIHRvICJzYW1zdW5nLHM2ZTNoYTIudHh0IGJpbmRpbmcgd2l0aCBjb21tZW50cy4K
PiAtIEZpeCB0aGUgcGFuZWwgbmFtZSBmcm9tIHM2ZTNoYTItZSB0byBzNmUzaGYyCj4KPiBIb2Vn
ZXVuIEt3b24gKDMpOgo+ICAgIGR0LWJpbmRpbmdzOiBBZGQgc3VwcG9ydCBmb3Igc2Ftc3VuZyBz
NmUzaGYyIHBhbmVsCj4gICAgZHJtL3BhbmVsOiBzNmUzaGEyOiBBZGQgc3VwcG9ydCBmb3IgczZl
M2hmMiBwYW5lbCBvbiBUTTJlIGJvYXJkCj4gICAgYXJtNjQ6IGR0czogZXh5bm9zOiBBZGQgc3Vw
cG9ydCBmb3IgczZlM2hmMiBwYW5lbCBkZXZpY2Ugb24gVE0yZSBib2FyZAo+Cj4gICAuLi4vYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9zYW1zdW5nLHM2ZTNoYTIudHh0ICAgICB8ICA1ICstCj4gICBh
cmNoL2FybTY0L2Jvb3QvZHRzL2V4eW5vcy9leHlub3M1NDMzLXRtMmUuZHRzICAgICB8IDExICsr
KysKPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTNoYTIuYyAgICAg
IHwgNjQgKysrKysrKysrKysrKysrKysrKy0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3MiBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
