From: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH -v2] drm/exynos: track vblank events on a per crtc basis
Date: Fri, 30 Jan 2015 15:57:53 +0000
Message-ID: <CAPj87rOJO5kYeVeserzrCk6AYu3CfrKBk8hhNCvzWUGQu_7ncg@mail.gmail.com>
References: <1422016980-23806-2-git-send-email-gustavo@padovan.org>
 <1422551459-25812-1-git-send-email-gustavo@padovan.org>
 <54CAF028.6060902@samsung.com> <20150130143037.GB30820@joana>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20150130143037.GB30820@joana>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Gustavo Padovan <gustavo@padovan.org>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, =?UTF-8?B?J+uMgOyduOq4sC9Nb2JpbGUgUy9XIFBsYXRmb3JtIExhYi4o7Ya17Iug7JewKS9FMyjsgqzsm5ApLw==?= =?UTF-8?B?7IK87ISx7KCE7J6QJw==?= <inki.dae@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

SGksCgpPbiAzMCBKYW51YXJ5IDIwMTUgYXQgMTQ6MzAsIEd1c3Rhdm8gUGFkb3ZhbiA8Z3VzdGF2
b0BwYWRvdmFuLm9yZz4gd3JvdGU6Cj4gMjAxNS0wMS0zMCBKb29ueW91bmcgU2hpbSA8ankwOTIy
LnNoaW1Ac2Ftc3VuZy5jb20+Ogo+PiBXZSB3aWxsIGxvc2UgdW5maW5pc2hlZCBwcmlvciBldmVu
dHMgYnkgdGhpcyBjaGFuZ2UuIFRoYXQncyB3aHkgd2UgdXNlCj4+IGxpbmtlZCBsaXN0Lgo+Cj4g
SSB0aGluayB5b3UgYXJlIHJpZ2h0LCBidXQgSSB3YXMgdXNpbmcgZXh5bm9zX2NydGMtPmV2ZW50
IHRvIGRvIGV4YWN0bHkgdGhlCj4gc2FtZSBhcyBleHlub3NfY3J0Yy0+cGVuZGluZ19mbGlwLiBT
byB3ZSB3ZXJlIGxvc2luZyBhIGV2ZW50IGluCj4gZXh5bm9zX2RybV9jcnRjX2RwbXMoKSBiZWZv
cmUgdG9vLiBJIGNoYW5nZSB0aGlzIHBhdGNoIHRvIGhhdmUgYSBwYWdlX2ZsaXAKPiBsaXN0IG9u
IHRoZSBjcnRjLgoKVGhlIHVzdWFsIGFwcHJvYWNoIGluIG90aGVyIGRyaXZlcnMgaXMgdG8gcmV0
dXJuIC1FQlVTWSB3aGVuIHRoZXJlIGlzCmFscmVhZHkgYW4gYXN5bmMgcGFnZWZsaXAgcGVuZGlu
Zy4gVGhpcyBkZWZpbml0ZWx5IG1ha2VzIHNlbnNlIHRvIG1lLAphcyBJIGRvbid0IHNlZSB0aGUg
cG9pbnQgb2Ygc3VibWl0dGluZyBwYWdlZmxpcHMgZmFzdGVyIHRoYW4gdGhlCmhhcmR3YXJlIGNh
biBhY3R1YWxseSByZW5kZXIsIGFuZCBwcmV0ZW5kaW5nIHRvIHRoZSBhcHBsaWNhdGlvbiB0aGF0
CnRoZXkgd2VyZSBhY3R1YWxseSBzaG93bi4KCkNoZWVycywKRGFuaWVsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
