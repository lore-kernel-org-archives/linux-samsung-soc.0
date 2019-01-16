From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [BUG bisect] kernel BUG at block/bio.c:1833 and fail to mount disk
Date: Wed, 16 Jan 2019 09:54:05 +0100
Message-ID: <CAJKOXPd2WiMC8uc1YuyR+_vEScSewMzQe1Y7UGHgxvkCD+tQ7A@mail.gmail.com>
References: <CAJKOXPdQaxKH3z3yMBggP3dAFJ3ecgCcHk=bGaVHZ-Q+V2Riug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdQaxKH3z3yMBggP3dAFJ3ecgCcHk=bGaVHZ-Q+V2Riug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Omar Sandoval <osandov@fb.com>, Ming Lei <ming.lei@redhat.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 16 Jan 2019 at 09:52, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Hi,
>
> On today's next-20190116 I see a bug during boot:
> [ 6.843308] kernel BUG at ../block/bio.c:1833!
> [ 6.847723] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> ...
> [ 7.543824] [<c044c144>] (bio_split) from [<00000000>] ( (null))
> [ 7.549881] Code: 13833b01 11c630bc e1a00006 e8bd8070 (e7f001f2)
>
> (not much in the calltrace)
> On all my boards. Also QEMU-arm fails.
>

I forgot the bisect commit:

258cfdfaf7bd729e759a0a91fd00ac9794796ad3 is the first bad commit
commit 258cfdfaf7bd729e759a0a91fd00ac9794796ad3
Author: Ming Lei <ming.lei@redhat.com>
Date:   Fri Jan 11 19:01:15 2019 +0800

    block: use bio_for_each_bvec() to compute multi-page bvec count

:040000 040000 d79b2e71d308650df4764ff644f29d3a24dbab96
0a5d624843b805ee0c9fd9a7e2d5163f5b15b167 M block

BR,
Krzysztof
