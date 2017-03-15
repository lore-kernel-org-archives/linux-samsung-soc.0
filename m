From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: Fix the width of PINCFG_TYPE_DRV
 bitfields for Exynos5433
Date: Wed, 15 Mar 2017 14:52:06 +0100
Message-ID: <CACRpkdaCzhShH2O2yZmyVB2LfqqXHXjbm9d=Jj0vPa5F2hx87A@mail.gmail.com>
References: <CGME20161230041426epcas1p1f827d3cee8b607d81e9921b412ddf301@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-2-andi.shyti@samsung.com>
 <CACRpkdbR3x14h38Gg7qpeWnswwD9qsS0zDUrrXCEJH-AdEB+cQ@mail.gmail.com>
 <58AF7CCB.5070303@samsung.com>
 <CACRpkda0-k7Vo9Y6yNtLNXu-gGnJW9y83t6W9p032KWjHYdMiw@mail.gmail.com>
 <CAJKOXPd1pRN47Ss5qTHUVAdPwxKqE5vGGevG1OhVH0uSZnotKA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPd1pRN47Ss5qTHUVAdPwxKqE5vGGevG1OhVH0uSZnotKA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Andi Shyti <andi@etezian.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andi Shyti <andi.shyti@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, stable <stable@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gVHVlLCBNYXIgMTQsIDIwMTcgYXQgMzoyNyBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPiBPbiBUdWUsIE1hciAxNCwgMjAxNyBhdCAzOjQ3IFBNLCBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3RlOgo+PiBPbiBGcmks
IEZlYiAyNCwgMjAxNyBhdCAxOjIyIEFNLCBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5n
LmNvbT4gd3JvdGU6Cj4+PiBPbiAyMDE264WEIDEy7JuUIDMw7J28IDIyOjI4LCBMaW51cyBXYWxs
ZWlqIHdyb3RlOgo+Pj4+IE9uIEZyaSwgRGVjIDMwLCAyMDE2IGF0IDU6MTQgQU0sIEFuZGkgU2h5
dGkgPGFuZGkuc2h5dGlAc2Ftc3VuZy5jb20+IHdyb3RlOgo+PiBQcm9iYWJseS4gU2VuZCBhIHBh
dGNoIGZpeGluZyBpdCB1cCBzbyBJIGNhbiBhcHBseSBpdC4KPj4KPj4gVGhlcmUgYXJlIG5vdyBz
b21ldGhpbmcgbGlrZSA1IGRpZmZlcmVudCBwZW9wbGUgc3VibWl0dGluZyBTYW1zdW5nIHBpbmN0
cmwKPj4gcGF0Y2hlcyB3aXRob3V0IGNvb3JkaW5hdGlvbiBzbyB0aGlzIHdpbGwgc3RhcnQgdG8g
aGFwcGVuIGEgbG90IGlmIHlvdSBrZWVwCj4+IHVwIHRoaXMgZGV2ZWxvcG1lbnQgcGFjZS4KPj4K
Pj4gQXMgSSBqdXN0IHdyb3RlIGluIGFub3RoZXIgbWFpbDogSSB3YW50IHNvbWVvbmUgdG8gc3Rl
cCB1cCBhbmQgY29sbGVjdAo+PiBTYW1zdW5nIHBhdGNoZXMgYW5kIHNlbmQgdGhlbSB0byBtZSB1
c2luZyBhIHB1bGwgcmVxdWVzdC4KPgo+IEkgdGhpbmsgd2UgY2FuIGhhbmRsZSBpdCBhcyB0aGVy
ZSBhcmUgdGhyZWUgb2YgdXMuCgpJIGp1c3QgdGhpcyB3ZWVrIHN0YXJ0ZWQgdG8gZ2V0IHBhdGNo
ZXMgZnJvbSBDaGFybGVzIEtlZXBheCwgYW5kIEkKdW5kZXJzdGFuZCB0aGF0IFdvbGZzb24gTWlj
cm8gaGFzIGEgYnVuY2ggb2YgU2Ftc3VuZyBwbGF0Zm9ybQp3b3JrIGdvaW5nIG9uLgoKU28gbm93
IGl0IGlzIGdldHRpbmcgYSBiaXQgbXVjaC4KCj4+IFNhbXN1bmcgcGVvcGxlIGFsc28gbmVlZCB0
byBzdGFydCByZXZpZXdpbmcgZWFjaCBvdGhlcidzIHBhdGNoZXMKPj4gbW9yZSBJIGd1ZXNzLCBi
dXQgbWFpbmx5IEkgbmVlZCBoZWxwIHdpdGggaW50ZWdyYXRpb24uCj4KPiBNb3JlIG9yIGxlc3Mg
cmVjZW50bHkgd2UgZG8gdGhlIHJldmlld3MuIFN1cmUgd2UgY2FuIGZvY3VzIG1vcmUuLi4gYW5k
Cj4gYWN0dWFsbHkgaGF2aW5nIGFuIGVudHJ5IGdhdGUgZm9yIHBhdGNoZXMgd291bGQgZW5zdXJl
IGF0IGxlYXN0IG9uZQo+IG1vcmUgcmV2aWV3IGZyb20gdGhlIGFwcGx5aW5nIHBlcnNvbi4KCklu
dGVyZXN0ZWQgaW4gdGhlIGpvYj8gOykKCkkgZ290IHB1bGwgcmVxdWVzdHMgZnJvbSB5b3UgYmVm
b3JlIHNvIEkga25vdyB5b3UgYXJlIGZhbWlsaWFyCndpdGggdGhlIHByb2Nlc3MuCgpJIHdvdWxk
IHZlcnkgbXVjaCBhcHByZWNpYXRlIGl0IGlmIGFsbCBTYW1zdW5nIHBpbiBjb250cm9sIHBhdGNo
ZXMKd2VyZSBxdWV1ZWQgYnkgeW91IGFuZCBzZW50IHRvIG1lIHdpdGggcHVsbCByZXF1ZXN0cyBi
YXNlZCBvbiBteQoiZGV2ZWwiIG9yICJmaXhlcyIgYnJhbmNoLiBJZiB0aGVyZSBpcyBnb2luZyB0
byBiZSBhIGxvdCBvZiBpdCBhbnl3YXlzLgoKTWF5YmUgbGFzdCBtZXJnZSB3aW5kb3cgd2FzIGEg
Yml0IHNwZWNpYWwgc2luY2UgTWFyZWsgZGlkIGFsbCB0aGlzCmdydW50IHdvcmsgb2Ygc3dpdGNo
aW5nIFM1UCAmIGZyaWVuZHMgb3ZlciB0byBwaW4gY29udHJvbCwgaW4gdGhhdApjYXNlIGl0IGlz
IG5vdCBzdWNoIGEgYmlnIGlzc3VlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0CmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwK
