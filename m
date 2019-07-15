From: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH v3 15/24] media: exynos4-is: Remove call to memset after dma_alloc_coherent
Date: Mon, 15 Jul 2019 17:43:45 +0800
Message-ID: <CABXRUiQ_N=N=weMnRea4d6PXjfghta=U1xhdv-tZpSvaGBnXGg@mail.gmail.com>
References: <CGME20190715090023eucas1p2ab541c5d4b4debe766295d3c6efbd1cd@eucas1p2.samsung.com>
 <20190715031851.6890-1-huangfq.daxian@gmail.com> <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37046e7b-fdde-c10f-4850-0b3efd4a00cd@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Sylwester Nawrocki <s.nawrocki@samsung.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=
=8815=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=885:00=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On 7/15/19 05:18, Fuqian Huang wrote:
> > In commit 518a2f1925c3
> > ("dma-mapping: zero memory returned from dma_alloc_*"),
> > dma_alloc_coherent has already zeroed the memory.
> > So memset is not needed
>
> I can't see any changes in the above mentioned commit that would
> make dma_alloc_coherent() (arm_coherent_dma_alloc()) zeroing its
> returned memory. Maybe you need to add a reference to some other
> instead?
>
In the last version patch set, I referenced the commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of
git://git.infradead.org/users/hch/dma-mapping")
in the commit log.
The merged commit mentions that
"ensure dma_alloc_coherent returns zeroed memory to
avoid kernel data leaks through userspace.
We already did this for most common architectures,
but this ensures we do it everywhere."
dma_alloc_coherent has already zeroed the memory during allocation
and the commit also deprecates dma_zalloc_coherent.
Greg and other maintainer told me to use the actual commit
rather than the merged commit.
So I reference the commit that ensures the dma_alloc_coherent to
returns zeroed memory every where.
Maybe this belongs to the `most common achitectures` and is not impacted
by the mentioned change.
Should I rewrite the commit log? Just mention that dma_alloc_coherent
has already zeroed the memory and not to reference the commit?
