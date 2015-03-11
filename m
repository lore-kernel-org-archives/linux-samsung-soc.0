From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [v3] libdrm: improvements to userspace exynos component
Date: Wed, 11 Mar 2015 10:09:27 +0900
Message-ID: <54FF95C7.6050200@samsung.com>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <CACvgo50e534ZjnNZHhj3jiiDNXeguDj7VMhrUVrByHZ_rh8i-w@mail.gmail.com>
 <CACvgo53QTAXNt3Z8JJ8ADsrNJDnR7V89EXEiQ_-+x_P8dnCNHA@mail.gmail.com>
 <54FCD767.3090607@math.uni-bielefeld.de> <54FF47B4.4070504@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <54FF47B4.4070504@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Rob Clark <robclark@freedesktop.org>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, ML dri-devel <dri-devel@lists.freedesktop.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGkgVG9iaWFzIGFuZCBFbWlsCgpPbiAyMDE164WEIDAz7JuUIDEx7J28IDA0OjM2LCBFbWlsIFZl
bGlrb3Ygd3JvdGU6Cj4gT24gMDgvMDMvMTUgMjM6MTIsIFRvYmlhcyBKYWtvYmkgd3JvdGU6Cj4+
IEhlbGxvIEVtaWwsCj4+IEVtaWwgVmVsaWtvdiB3cm90ZToKPj4+IEknbSBwbGFubmluZyB0byBw
dXNoIHRoZSBhYm92ZSBtZW50aW9uZWQgcGF0Y2hlcyBhcm91bmQgbHVuY2h0aW1lIHRoaXMKPj4+
IFR1ZXNkYXkuIElmIGFueW9uZSBoYXMgb2JqZWN0aW9ucyBwbGVhc2Ugc3BlYWsgdXAuCj4+IEkg
ZG91YnQgeW91J3JlIGdvaW5nIHRvIGhlYXIgYW55dGhpbmcgZnJvbSBJbmtpIERhZS4KPiBEZXNw
aXRlIHRoYXQgaXQgbWlnaHQgc291bmQgYSBiaXQgcnVkZSwgSSBzaW5jZXJlbHkgaG9wZSB0aGF0
IHlvdSdyZQo+IHdyb25nIG9uIHRoaXMgb25lLiBJJ20gd291bGQgYXNzdW1lIHRoYXQgdGhlIGxh
Y2sgb2YgcmVwbHkgZnJvbSBJbmtpIHdhcwo+IGR1ZSB0byBiZWluZyBoaW0gYnVzeSwgcmF0aGVy
IHRoYW4gaWdub3JpbmcgeW91Lgo+IAoKSSB3YXMgYnVzeSBzbyBJIGRpZG4ndCBjYXJlIG9mIGl0
LiBTb3JyeSBmb3IgdGhpcy4KCj4+IEFueXdheSwgdGhhbmtzIGZvciBjb25zaWRlcmluZyB0byBt
ZXJnZSB0aGlzLCBldmVuIHRob3VnaCBpdCBsYWNrcyB0aGUKPj4gcmV2aWV3IG9mIHRoZSBleHlu
b3MtZHJtIG1haW50YWluZXIuCj4+Cj4+IEF0IGxlYXN0IHRoaXMgZ2l2ZXMgbWUgY29uZmlkZW5j
ZSB0byBjb250aW51ZSB0byB3b3JrIG9uIHRoaXMgKEkgYWxzbwo+PiB3YW50IHRvIGV4cG9zZSBh
c3luYyBnMmQgb3BlcmF0aW9uIHRvIHVzZXJzcGFjZSkuCj4+Cj4gR2xhZCB0aGF0IHlvdSdyZSBz
dGlsbCBwbGFubmluZyB0byB3b3JrIG9uIHRoaXMuIElkZWFsbHkgdGhlCj4gRXh5bm9zL1NhbXN1
bmcgZ3V5cyB3aWxsIHRha2UgYSBsb29rIGF0IHRoZSByZXN0IG9mIHlvdXIgcGF0Y2hlcyB3aGlj
aAo+IHJlcXVpcmUgc29tZW9uZSB3aXRoIGdyZWF0ZXIga25vd2xlZGdlIG9mIHRoZSBoYXJkd2Fy
ZSB0aGFuIG1lIDotKQo+IAoKUmlnaHQuIFdlIHdpbGwgcmV2aWV3IHRoaXMgcGF0Y2ggYW5kIHJl
cGx5IGF0IGxlYXN0IHVudGlsIHRvbW9ycm93LgoKVGhhbmtzLApJbmtpIERhZQoKPiBDaGVlcnMs
Cj4gRW1pbAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHA6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
