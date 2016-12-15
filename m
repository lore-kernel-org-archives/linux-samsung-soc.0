From: hoegeun kwon <hoegeun.kwon@samsung.com>
Subject: Re: [PATCH 1/2] drm/panel: Add support for S6E3HA2 panel driver on TM2
 board
Date: Thu, 15 Dec 2016 10:53:40 +0900
Message-ID: <ddc3c06d-94fc-f90d-75d5-c662777916bb@samsung.com>
References: <1481695445-13088-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20161214060522epcas2p49bd0d7ca0f8fc370e91e0de199f4c788@epcas2p4.samsung.com>
 <1481695445-13088-2-git-send-email-hoegeun.kwon@samsung.com>
 <583d4da7-a3c5-f84f-ba11-1bb1e6890e9b@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <583d4da7-a3c5-f84f-ba11-1bb1e6890e9b@samsung.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrzej Hajda <a.hajda@samsung.com>, thierry.reding@gmail.com, kgene@kernel.org, krzk@kernel.org
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Donghwa Lee <dh09.lee@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?B?7LWc7LCs7Jqw?= <cw00.choi@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

CgpPbiAxMi8xNC8yMDE2IDExOjE0IFBNLCBBbmRyemVqIEhhamRhIHdyb3RlOgo+IE9uIDE0LjEy
LjIwMTYgMDc6MDQsIEhvZWdldW4gS3dvbiB3cm90ZToKPj4gVGhpcyBwYXRjaCBhZGQgc3VwcG9y
dCBmb3IgTUlQSS1EU0kgYmFzZWQgUzZFM0hBMiBBTU9MRUQgcGFuZWwKPj4gZHJpdmVyLiBUaGlz
IHBhbmVsIGhhcyAxNDQweDI1NjAgcmVzb2x1dGlvbiBpbiA1LjctaW5jaCBwaHlzaWNhbAo+PiBw
YW5lbCBpbiB0aGUgVE0yIGRldmljZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG9uZ2h3YSBMZWUg
PGRoMDkubGVlQHNhbXN1bmcuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBIeXVuZ3dvbiBId2FuZyA8
aHVtYW4uaHdhbmdAc2Ftc3VuZy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEhvZWdldW4gS3dvbiA8
aG9lZ2V1bi5rd29uQHNhbXN1bmcuY29tPgo+IEhpIEhvZWdldW4gS3dvbiwKPgo+IElzIHRoZXJl
IGEgcmVhc29uIHRvIHVwc3RyZWFtIG9ic29sZXRlIGRyaXZlcj8gQ3VycmVudCB2ZXJzaW9uIG9m
IHRoZQo+IGRyaXZlciBpcyBhdmFpbGFibGUgYXQgWzFdLiBJdCBkaWZmZXJzIHNpZ25pZmljYW50
bHkgYW5kIGNvbnRhaW5zCj4gbXVsdGlwbGUgZml4ZXMgYW5kIGltcHJvdmVtZW50cy4gSSBndWVz
cyBpdCBzdGlsbCByZXF1aXJlcyBzb21lCj4gcG9saXNoaW5nIGJ1dCBpdCBpcyBiZXR0ZXIgYmFz
ZSBmb3Igc3RhcnQuCj4KPiBbMV06Cj4gaHR0cHM6Ly9yZXZpZXcudGl6ZW4ub3JnL2dpdC8/cD1w
bGF0Zm9ybS9rZXJuZWwvbGludXgtZXh5bm9zLmdpdDthPWJsb2I7Zj1kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtczZlM2hhMi5jO2hiPXJlZnMvaGVhZHMvdGl6ZW4KPgo+IFJlZ2FyZHMKPiBB
bmRyemVqCgpIaSBBbmRyemVqIEhhamRhLAoKVGhlIGN1cnJlbnQgZHJpdmVyIGZvY3VzIG9uIGJh
c2ljIGZ1bmN0aW9uYWxpdHkuIFRoZXJlZm9yZSwgVlIgYW5kIEhNVAptb2RlcyBpbiBbMV0gaGF2
ZSBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgcGF0Y2guIFZSIGFuZCBITVQgbW9kZXMKYXJlIGFkZGVk
IGFmdGVyIHRoZSBiYXNpYyBmdW5jdGlvbnMgYXJlIHJlZmxlY3RlZC4KCkJlc3QgUmVnYXJkcywK
SG9lZ2V1biBLd29uCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
