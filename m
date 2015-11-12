From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 18/25] drm/exynos: fimd: fix dma burst size setting for
 small plane size
Date: Thu, 12 Nov 2015 15:23:31 +0000
Message-ID: <CAPj87rP2XvZDJqO4qJ_rak8RtG6ein1=_L6jp8A6OzKSkqxVkg@mail.gmail.com>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-19-git-send-email-m.szyprowski@samsung.com>
 <5644AD75.6000103@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5644AD75.6000103@math.uni-bielefeld.de>
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
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGV5IFRvYmlhcywKCk9uIDEyIE5vdmVtYmVyIDIwMTUgYXQgMTU6MTcsIFRvYmlhcyBKYWtvYmkK
PHRqYWtvYmlAbWF0aC51bmktYmllbGVmZWxkLmRlPiB3cm90ZToKPiBUaGlzIG9uZSBsb29rcyBh
IGJpdCBzdHJhbmdlLiBJdCBvbmx5IGNoYW5nZXMgdGhlIGFyZ3VtZW50IGxpc3Qgb2YKPiBmaW1k
X3dpbl9zZXRfcGl4Zm10KCkgYnV0IHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IGl0IGFjdHVhbGx5
IGZpeGVzCj4gc29tZXRoaW5nLgo+Cj4gVGhlIGNvcnJlc3BvbmRpbmcgdXBzdHJlYW0gY29tbWl0
Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC9jb21taXQvP2lkPTY2MzY3NDYxZTU3MzMyMWYwZmJiMGJlMDM5MTE2NWI1YTU0
ZDVmZTQKCkl0J3Mgc3VidGxlOgoKPj4gLSAgICAgZmltZF93aW5fc2V0X3BpeGZtdChjdHgsIHdp
biwgZmIpOwo+PiArICAgICBmaW1kX3dpbl9zZXRfcGl4Zm10KGN0eCwgd2luLCBmYi0+cGl4ZWxf
Zm9ybWF0LCBzdGF0ZS0+c3JjLncpOwoKaS5lLiByYXRoZXIgdGhhbiBjaGVja2luZyB0aGUgdG90
YWwgd2lkdGggb2YgdGhlIGFsbG9jYXRlZCBmYiwgd2UKY2hlY2sgdGhlIHdpZHRoIHdlIGFyZSBf
YWN0dWFsbHlfIHNjYW5uaW5nIG91dCBmcm9tIHRoZSBmYi4gU28gSSB0aGluawp0aGUgcGF0Y2gg
aXMgY29ycmVjdC4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
