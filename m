From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/10] Add RK3399 eDP support and fix some bugs to
 analogix_dp driver.
Date: Thu, 26 May 2016 08:48:47 -0400
Message-ID: <4e1c65f8-5a5b-dbb9-35fe-ef09c0758536@osg.samsung.com>
References: <1464066086-21967-1-git-send-email-ykk@rock-chips.com>
 <5746C321.9000707@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5746C321.9000707@rock-chips.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Yakir Yang <ykk@rock-chips.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, Jingoo Han <jingoohan1@gmail.com>, emil.l.velikov@gmail.com, Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mark Yao <yzq@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Thierry Reding <treding@nvidia.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGVsbG8gWWFraXIsCgpPbiAwNS8yNi8yMDE2IDA1OjM0IEFNLCBZYWtpciBZYW5nIHdyb3RlOgo+
IEhpIEphdmllciwKPiAKPiBPbiAwNS8yNC8yMDE2IDAxOjAxIFBNLCBZYWtpciBZYW5nIHdyb3Rl
Ogo+PiBIaSBhbGwsCj4+Cj4+IFRoaXMgc2VyaWVzIGhhdmUgYmVlbiBwb3N0ZWQgYWJvdXQgb25l
IG1vbnRoLCBzdGlsbCBubyBjb21tZW50cywgaGVscCBoZXJlIDooCj4gVGhpcyBzZXJpZXMgd29y
a3MgcmlnaHRseSBvbiBSb2NrY2hpcCBwbGF0Zm9ybSwgYW5kIG1vc3Qgb2YgdGhlbSBoYXZlbid0
IHRvdWNoIHRoZQo+IGNvbW1vbiBhbmFsb2dpeF9kcCBkcml2ZXIgKGV4Y2VwdCBmb3IgdGhlIGhv
dHBsdWcgZml4ZWQpLiBTbyBpIGd1ZXNzIEV4eW5vcyBwbGF0Zm9ybQo+IHNob3VsZCBhbHNvIGhh
cHB5IHdpdGggdGhpcyBjaGFuZ2VzLgo+IAo+IEJ1dCBub3Qgc3VyZSBhYm91dCB0aGF0LiBTbywg
aXMgaXQgcG9zc2libGUgdGhhdCB5b3UgY291bGQgaGVscCB0byBjaGVjayB0aGlzIG9uIEV4eW5v
cwo+IENocm9tZWJvb2ssIGlmIHNvIGkgd291bGQgYmUgdmVyeSBncmF0ZWZ1bCBhYm91dCB0aGF0
Lgo+CgpPZiBjb3Vyc2UsIEknIGxsIHRlc3QuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSBtZSBh
IGJyYW5jaCB0aGF0IEkgY2FuCnB1bGwgZGlyZWN0bHkgdG8gYXZvaWQgY2hlcnJ5LXBpY2tpbmcg
YWxsIHRoZSBwYXRjaGVzIGZyb20gdGhlIGxpc3Q/IAogCj4gVGhhbmtzLAo+IC0gWWFraXIKPj4K
CkJlc3QgcmVnYXJkcywKLS0gCkphdmllciBNYXJ0aW5leiBDYW5pbGxhcwpPcGVuIFNvdXJjZSBH
cm91cApTYW1zdW5nIFJlc2VhcmNoIEFtZXJpY2EKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
