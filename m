From: Seungwon Jeon <tgih.jun@samsung.com>
Subject: RE: [PATCH] mmc: core: Add cache control for eMMC4.5 device
Date: Thu, 06 Oct 2011 17:22:26 +0900
Message-ID: <000f01cc8401$14d6ffd0$3e84ff70$%jun@samsung.com>
References: <1315466950-28973-1-git-send-email-tgih.jun@samsung.com>
 <4E8C43B5.7020704@intel.com> <000401cc83e1$ca2c8fa0$5e85aee0$%jun@samsung.com>
 <CANz0V+4Ue_TNXsJEEpGwTyHFUJjz+f41aF+VfWdKqc=BqW1-0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-mmc-owner@vger.kernel.org>
In-reply-to: <CANz0V+4Ue_TNXsJEEpGwTyHFUJjz+f41aF+VfWdKqc=BqW1-0w@mail.gmail.com>
Content-language: ko
Sender: linux-mmc-owner@vger.kernel.org
To: "'Andrei E. Warkentin'" <andrey.warkentin@gmail.com>
Cc: 'Adrian Hunter' <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, cjb@laptop.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, dh.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Andrei E. Warkentin wrote:
> Hi Seungwon,
> 
> 2011/10/6 Seungwon Jeon <tgih.jun@samsung.com>:
> > Adrian Hunter wrote:
> >> On 08/09/11 10:29, Seungwon Jeon wrote:
> >> > This patch adds cache feature of eMMC4.5 Spec.
> >> > If device supports cache capability, host can utilize some specific
> >> > operations.
> >> >
> >> > Signed-off-by: Seungwon Jeon<tgih.jun@samsung.com>
> >> > ---
> 
> I don't think eMMC 4.5 is public yet, so could you elaborate on the
> volatile cache? I am
> in particular interested in how the volatile cache affects reliable
> writes (I would assume it doesn't
> affect them at all).
Right, no effect.
Data of reliable write will be written the non-volatile memory not cache forcedly.
> 
> A
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

