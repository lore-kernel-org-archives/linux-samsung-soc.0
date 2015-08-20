From: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: HOW TO MAKE SAMPLES DIR IN THE MAINLINE KERNEL TO BE COMPILED
 AND CREATED ".KO" FILE IN THE SAME DIRECTORY
Date: Thu, 20 Aug 2015 05:20:22 -0500
Message-ID: <55D5A9E6.1010509@rock-chips.com>
References: <CAAbfDBcA-gRh8pbKxDGvAZqPbyLzUK3HPqU42c7LK7fX4xD_KA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAbfDBcA-gRh8pbKxDGvAZqPbyLzUK3HPqU42c7LK7fX4xD_KA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ravi ranjan Mishra <raviranjanmishra24-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, seanpaul-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Palatin <vpalatin-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, djkurtz-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, ajaynumb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ravi,

I'm wondering is your e-mail come from eDP thread ? cause I see lots of 
cc guys some as eDP emails :)

And for your question, I am not sure I understand rightly. Do you mean 
that your ".ko" module not in
the same directory with driver source code?

If it's your question, I think you can fix it by add SUBDIRS flag in 
your driver makefile.
I test it on kernel 3.14, but I think it would be okay on mainline 
kernel, it works good
in my side, I see hello.ko in my hello/

[~/work/kernel-3.14/hello] 7392h41m $ ls
hello.c  hello.ko  hello.mod.c  hello.mod.o  hello.o  Makefile 
modules.order  Module.symvers

# My test makefile
obj-m := hello.o

KERNEL_DIR := ~/work/kernel-3.14
PWD := $(shell pwd)

all:
     make -C $(KERNEL_DIR) SUBDIRS=$(PWD) modules

clean:
     rm *.o *.ko *.mod.c

.PHONY:clean


Wish can help,
- Yakir

On 08/20/2015 03:45 AM, ravi ranjan Mishra wrote:
> Hi ,
>
> i did make in the kernel directory but sample directory is not able to 
> compiled and generating .ko file in the same directory.
>
> can you please tell.
>
> Thanks,
> Ravi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
