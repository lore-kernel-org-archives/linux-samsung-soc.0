From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 17/18] [media] s3c-camif: fix dma_addr_t printks
Date: Thu, 25 Sep 2014 12:40:49 +0200
Message-ID: <5423F131.50300@samsung.com>
References: <c8634fac0c56cfaa9bdad29d541e95b17c049c0a.1411597610.git.mchehab@osg.samsung.com>
 <4749fc9fe2ece4e42627b27b01d6939c536fbcea.1411597610.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <4749fc9fe2ece4e42627b27b01d6939c536fbcea.1411597610.git.mchehab@osg.samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 25/09/14 00:27, Mauro Carvalho Chehab wrote:
> drivers/media//platform/s3c-camif/camif-capture.c: In function =E2=80=
=98camif_prepare_addr=E2=80=99:
> include/linux/dynamic_debug.h:64:16: warning: format =E2=80=98%x=E2=80=
=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argume=
nt 5 has type =E2=80=98dma_addr_t=E2=80=99 [-Wformat=3D]
>   static struct _ddebug  __aligned(8)   \
[...]
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

Thanks,

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
