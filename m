From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v5 09/12] drm/exynos: remove exported functions from
 exynos_drm_plane
Date: Thu, 21 May 2015 13:26:15 -0300
Message-ID: <20150521162615.GA14089@joana>
References: <1432220576-18532-1-git-send-email-gustavo@padovan.org>
 <1432220576-18532-11-git-send-email-gustavo@padovan.org>
 <d7371b0c9e0e68b22cc66325d9b84625@math.uni-bielefeld.de>
 <20150521153357.GB1641@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20150521153357.GB1641@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Cc: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNS0wNS0yMSBHdXN0YXZvIFBhZG92YW4gPGd1c3Rhdm8ucGFkb3ZhbkBjb2xsYWJvcmEuY28u
dWs+OgoKPiAyMDE1LTA1LTIxIFRvYmlhcyBKYWtvYmkgPHRqYWtvYmlAbWF0aC51bmktYmllbGVm
ZWxkLmRlPjoKPiAKPiA+IEhpLAo+ID4gCj4gPiBsaWtlIEkgc2FpZCBiZWZvcmUsIHRoaXMgY2xh
c2hlcyB3aXRoIG15IGNvbW1pdCAnZHJtL2V4eW5vczogcGxhbmU6IGhvbm9yCj4gPiBidWZmZXIg
b2Zmc2V0IGZvciBkbWFfYWRkcicgKDVkODc4YmRiNTFiZDc5MTViYTNkZWY4YjUzMTIzOGM2NzYy
NGFhNTgpLAo+ID4gd2hpY2ggaXMgY3VycmVudGx5IHNpdHRpbmcgaW4gYWlybGllZCdzIGRybS1m
aXhlcy4KPiAKPiBJbmtpIGhhcyB0byBtZXJnZSBoaXMgLWZpeGVzIHRyZWUgaW50byBleHlub3Mt
ZHJtLW5leHQgdG8gc29sdmUgdGhpcy4KPiBJdCBpcyB0aGUgb25seSB3YXkgSSBjYW4gcmViYXNl
IG9uIHRvcCBvZiB5b3VyIGNvbW1pdCBhbmQgc29sdmUgdGhlCj4gY29uZmxpY3QuCj4gQW55d2F5
LCBJIGp1c3QgZmlndXJlZCB0aGF0IGV4eW5vcy1kcm0tbmV4dCB3YXMgdXBkYXRlZCBmcm9tIHll
c3RlcmRheQo+IHRvIHRvZGF5IHNvIHRoaXMgdjUgZG9lc24ndCBhcHBseSBvbiB0b2RheSdzIHRy
ZWUuIEknbGwgc2VuZCBhIHY2IG9uY2UKPiBJbmtpIG1lcmdlcyAiZHJtL2V4eW5vczogcGxhbmU6
IGhvbm9yIGJ1ZmZlciBvZmZzZXQgZm9yIGRtYV9hZGRyIiBpbnRvCj4gZXh5bm9zLWRybS1uZXh0
Lgo+IAo+IElua2ksIGNhbiB5b3UgcGxlYXNlIGRvIHRoYXQ/IHNvIHdlIGNhbiBwcm9jZWVkIHdp
dGggYXRvbWljIGFuZAo+IGhvcGVmdWxseSBoYXZlIGl0IHJlYWR5IGZvciA0LjIgbWVyZ2Ugd2lu
ZG93LgoKQWN0dWFsbHkgdGhlIHBhdGNoIGlzIG9uIGV4eW5vcy1kcm0tbmV4dCBidXQgd2l0aCBh
IGRpZmZlcmVudCBjb21taXQgaWQuCkkgd29uZGVyIHdoeS4gV2h5IGRpZCB5b3UgYXBwbGllZCBp
dCBkaXJlY3RseSB0byB5b3VyIGJyYW5jaCBpbnN0ZWFkIG9mCm1lcmdpbmcgdGhlIC1maXhlcyB0
cmVlPyBOb3cgd2UgaGF2ZSB0aGUgc2FtZSBjb21taXQgd2l0aCB0aGUgZGlmZmVyZW50cwpoYXNo
ZXMgaW4gdGhlIHRyZWUuCgoJR3VzdGF2bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
