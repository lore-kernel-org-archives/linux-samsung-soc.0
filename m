From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH V4 00/10] drm: exynos: few patches to enhance bridge chip
 support
Date: Tue, 15 Jul 2014 14:37:21 +0900
Message-ID: <53C4BE11.1020302@samsung.com>
References: <1402511228-18945-1-git-send-email-ajaykumar.rs@samsung.com>
 <53B4E7D6.6000204@suse.de>
 <CAD=FV=UH=sgZKFxH35qfBb-XJGJ9ctSSdVRhTEkt6zk0f+R4mA@mail.gmail.com>
 <CAEC9eQO+j8iikztW4Q47xKRM71C6qGaCuBTdSW=odKG0kRsWBg@mail.gmail.com>
 <CAOesGMgvLr+14tFP3N-kTwH9wJ8+1=OXoiEo9_KFDyOSFpK7nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAOesGMgvLr+14tFP3N-kTwH9wJ8+1=OXoiEo9_KFDyOSFpK7nw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Olof Johansson <olof@lixom.net>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Vincent Palatin <vpalatin@chromium.org>, Sean Paul <seanpaul@google.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Doug Anderson <dianders@chromium.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>, Andrzej Hajda <a.hajda@samsung.com>, cpgs@samsung.com, Ajay kumar <ajaynumb@gmail.com>, =?UTF-8?B?U3TDqXBoYW5lIE1hcmNoZXNp?= =?UTF-8?B?bg==?= <marcheu@chromium.org>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, Ajay Kumar <ajaykumar.rs@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

T24gMjAxNOuFhCAwN+yblCAxNeydvCAwMjoyMiwgT2xvZiBKb2hhbnNzb24gd3JvdGU6Cj4gSW5r
aSwKPiAKPiBZb3UgaGF2ZSBhY2tzLCBhbmQgeW91IGhhdmUgdGhlIHRlc3RlZC1ieXMgeW91IHJl
cXVlc3RlZC4gQ2FuIHlvdQo+IHBsZWFzZSBwaWNrIHRoaXMgdXAgcXVpY2tseSBzbyB0aGF0IHdl
IGNhbiBoYXZlIGdyYXBoaWNzIHdvcmtpbmcgd2l0aAo+IGFuIHVwc3RyZWFtIGtlcm5lbCBvbiBj
aHJvbWVib29rcz8KPiAKPiBEYXZlLCBpZiBJbmtpIGtlZXBzIGRyYWdnaW5nIGhpcyBmZWV0IGxp
a2UgdGhpcyBjYW4geW91IHBsZWFzZSBhcHBseQo+IHRoaXMgc2VyaWVzIGRpcmVjdGx5PyBUaGVz
ZSBkZWxheXMgYXJlIHJpZGljdWxvdXMgYW5kIGl0J3MgaHVydGluZwo+IGZvcndhcmQgcHJvZ3Jl
c3Mgb24gdGhlIHBsYXRmb3JtIGFzIGEgd2hvbGUuCj4gCgpIaSwKCkkgYW0gbm90IHJlYWxseSBk
cmFnZ2luZy4gV2UgbmVlZCB0byB3YWl0IGZvciBBQ0tzIG9mIG90aGVyIG1haW50YWluZXJzOgpw
bGVhc2Uga25vdyB0aGF0IHRoaXMgcGF0Y2ggc2VyaWVzIGluY2x1ZGVzIG5vbi1FeHlub3MgcGFy
dC4KCkZvciB0aGlzLCBBamF5IHJlcXVlc3RlZCBhbHJlYWR5IGl0IHRvIERhbmllbCwgVGhpZXJy
eSwgYW5kIFJvYiBhIHdlZWsKYWdvLiBJZiB0aGVyZSBhcmUgbm8gYW55IEFDS3MgZnJvbSB0aGVt
IHVudGlsIHRoaXMgd2VlaywgSSBwbGFuIHRvIHBpY2sKdGhlbSB1cC4KClNvIHBsZWFzZSB3YWl0
LgoKVGhhbmtzLApJbmtpIERhZQoKPiAKPiBUaGFua3MsCj4gCj4gLU9sb2YKPiAKPiAKPiBPbiBU
dWUsIEp1bCA4LCAyMDE0IGF0IDExOjExIFBNLCBBamF5IGt1bWFyIDxhamF5bnVtYkBnbWFpbC5j
b20+IHdyb3RlOgo+PiBIaSBEYW5pZWwsIFRoaWVycnkgYW5kIFJvYiwKPj4KPj4gQ3VycmVudGx5
LCB0aGUgZm9sbG93aW5nIGJvYXJkcyBhcmUgd29ya2luZyBmaW5lIHdpdGggdGhlIGJyaWRnZSBj
aGlwIHNlcmllczoKPj4gLSBzbm93Cj4+IC0gc3ByaW5nCj4+IC0gcGVhY2hfcGl0Cj4+IC0gcGVh
Y2hfcGkKPj4gQW5kLCBJIGRpZCBjaGFuZ2UgbXkgb3JpZ2luYWwgcGF0Y2hzZXQgYmFzZWQgb24g
eW91ciBjb21tZW50cyBoZXJlOgo+PiAoMSkgW1JGQyBWMiAwLzNdIGRybS9icmlkZ2U6IHBhbmVs
IGFuZCBjaGFpbmluZwo+PiAgICAgICAgIGh0dHA6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGlu
dXgtc2Ftc3VuZy1zb2MvbXNnMzAxNjAuaHRtbAo+PiAoMikgW1JGQyBWMyAwLzNdIGRybS9icmlk
Z2U6IHBhbmVsIGFuZCBjaGFpbmluZwo+PiAgICAgICAgIGh0dHA6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvbGludXgtc2Ftc3VuZy1zb2MvbXNnMzA1MDcuaHRtbAo+Pgo+PiBJZiB5b3UgdGhpbmsg
dGhpcyBpcyBub3QgdGhlIHJpZ2h0IHdheSBvZiBkb2luZyBpdCwgcGxlYXNlIGNvbWUgZm9yd2Fy
ZCB3aXRoCj4+IG1vcmUgc3VnZ2VzdGlvbnMsIG9yIGtpbmRseSBBQ0sgaXQuCj4+IEkgYW0ganVz
dCB3b25kZXJpbmcgaG93IGxvbmcgY2FuIEkga2VlcCB3YWl0aW5nIGZvciBjb21tZW50cz8KPj4K
Pj4gUmVnYXJkcywKPj4gQWpheQo+PiAtLQo+PiBUbyB1bnN1YnNjcmliZSBmcm9tIHRoaXMgbGlz
dDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUgZGV2aWNldHJlZSIgaW4KPj4gdGhlIGJvZHkg
b2YgYSBtZXNzYWdlIHRvIG1ham9yZG9tb0B2Z2VyLmtlcm5lbC5vcmcKPj4gTW9yZSBtYWpvcmRv
bW8gaW5mbyBhdCAgaHR0cDovL3ZnZXIua2VybmVsLm9yZy9tYWpvcmRvbW8taW5mby5odG1sCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
