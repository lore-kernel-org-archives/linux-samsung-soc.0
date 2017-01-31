From: Inki Dae <daeinki@gmail.com>
Subject: Re: [PATCH v8 2/3] drm/panel: Add support for S6E3HA2 panel driver on
 TM2 board
Date: Tue, 31 Jan 2017 19:37:01 +0900
Message-ID: <CAAQKjZNN98pah8ht=kSmwsVybA5cMP=Z6BVkfZ6HH-5rRYFQ9w@mail.gmail.com>
References: <1484116439-7275-1-git-send-email-hoegeun.kwon@samsung.com>
 <CGME20170111063408epcas5p2e6ec091549c3ffed8462fd95d11d3c82@epcas5p2.samsung.com>
 <1484116439-7275-3-git-send-email-hoegeun.kwon@samsung.com>
 <08c5d94b-c76f-af14-c08f-478e26a34a7c@samsung.com>
 <588FD3C3.7080508@samsung.com>
 <CAJKOXPfB0yuQY2bdTEYegU+eakBw32X80ALJkxB2sUX8xFjy+g@mail.gmail.com>
 <58905A2B.9090101@samsung.com>
 <CAJKOXPeCF3+YXk-GHmewn6fi0rcPbQ_GoPOeFRP2KYN=6KLLxw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAJKOXPeCF3+YXk-GHmewn6fi0rcPbQ_GoPOeFRP2KYN=6KLLxw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Donghwa Lee <dh09.lee@samsung.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, Andi Shyti <andi.shyti@samsung.com>, Hyungwon Hwang <human.hwang@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

MjAxNy0wMS0zMSAxOTowMSBHTVQrMDk6MDAgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPjoKPiBPbiBUdWUsIEphbiAzMSwgMjAxNyBhdCAxMTozNCBBTSwgSW5raSBEYWUgPGlu
a2kuZGFlQHNhbXN1bmcuY29tPiB3cm90ZToKPj4KPj4KPj4gMjAxN+uFhCAwMeyblCAzMeydvCAx
ODoyMuyXkCBLcnp5c3p0b2YgS296bG93c2tpIOydtCjqsIApIOyTtCDquIA6Cj4+PiBPbiBUdWUs
IEphbiAzMSwgMjAxNyBhdCAyOjAxIEFNLCBJbmtpIERhZSA8aW5raS5kYWVAc2Ftc3VuZy5jb20+
IHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiAyMDE364WEIDAx7JuUIDI07J28IDEwOjUw7JeQIEhvZWdl
dW4gS3dvbiDsnbQo6rCAKSDsk7Qg6riAOgo+Pj4+PiBEZWFyIFRoaWVycnksCj4+Pj4+Cj4+Pj4+
IENvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IHRoaXMgcGF0Y2g/Cj4+Pj4KPj4+PiBUaGllcnJ5LCBJ
IHRoaW5rIHRoaXMgcGF0Y2ggaGFzIGJlZW4gcmV2aWV3ZWQgZW5vdWdoIGJ1dCBubyBjb21tZW50
IGZyb20geW91LiBTZWVtcyB5b3UgYXJlIGJ1c3kuIEkgd2lsbCBwaWNrIHVwIHRoaXMuCj4+Pj4K
Pj4+Cj4+PiBDb21tZW50cyBmcm9tIHY4IHdlcmUgbm90IHJlc29sdmVkIGFuZCBJIHRoaW5rIHdl
IGFyZSB3YWl0aW5nIGZvciB2OToKPj4+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE3LzEvMTEv
MTc4Cj4+Pgo+Pj4gSWYgdGhhdCBpcyBub3QgY29ycmVjdCB0aGVuIHBsZWFzZSBjbGFyaWZ5Lgo+
Pgo+PiBTZWVtcyB5b3UgcG9pbnRlZCB0byBjaGFuZ2UgdGUtZ3Bpb3MgYmluZGluZ3MgdG8gb3B0
aW9uYWwuIHJpZ2h0Pwo+Pgo+PiBJIHRob3VnaHQgUm9iIGxlZnQgYWNrIHNvIGl0J3Mgbm8gcHJv
YmxlbS4KPj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTcvMS8xMy82MjYKPgo+IFllcywgY2hh
bmdlIHRoZW0gdG8gb3B0aW9uYWwuIEkgdGhpbmsgaXQgaXMgYSBwcm9ibGVtIChyZWdhcmRsZXNz
IG9mCj4gUm9iJ3MgYWNrKSBiZWNhdXNlIHlvdSBhcmUgbWVyZ2luZyBhIGRyaXZlciByZXF1aXJp
bmcgYSBwcm9wZXJ0eSB3aGljaAo+IHNvb24geW91IHdhbnQgdG8gcmVtb3ZlLiBJZiB5b3UgbWVy
Z2UgaXQgKGxpa2UgdGhpcykgcmVtb3ZhbCBvZgo+IHRlLWdwaW9zIHByb3BlcnR5IHdpbGwgYmUg
YnJlYWthZ2Ugb2YgQUJJLiBUaGlzIGlzIG5vdCBhIHNlcmlvdXMKPiBwcm9ibGVtIGJ1dCBrbm93
aW5nIHN1Y2ggcGxhbiBvZiB0ZS1ncGlvcyByZW1vdmFsIHVwZnJvbnQsIGl0IHdvdWxkIGJlCj4g
d3JvbmcgdG8gY29tbWl0IHN1Y2ggZHJpdmVyLgoKVGhpcyBpcyBhIHRyaXZpYWwgdGhpbmcgc28g
aXQgZG9lc24ndCBtYWtlIGJyZWFrYWdlIG9mIEFCSSBiZWNhdXNlIHRoZQpwcm9wZXJ0eSwgdGUt
Z3Bpb3MsIGlzICpvcHRpb25hbCouCgpBbnl3YXksIHRoaXMgd291bGRuJ3QgYmUgKnRoZSB0aGlu
Z3MqIFRoaWVycnkgbWVudGlvbmVkLgoKVGhhbmtzLApJbmtpIERhZQoKPgo+IEJlc3QgcmVnYXJk
cywKPiBLcnp5c3p0b2YKPiAtLQo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBsaXN0OiBzZW5k
IHRoZSBsaW5lICJ1bnN1YnNjcmliZSBsaW51eC1zYW1zdW5nLXNvYyIgaW4KPiB0aGUgYm9keSBv
ZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2VybmVsLm9yZwo+IE1vcmUgbWFqb3Jkb21v
IGluZm8gYXQgIGh0dHA6Ly92Z2VyLmtlcm5lbC5vcmcvbWFqb3Jkb21vLWluZm8uaHRtbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
