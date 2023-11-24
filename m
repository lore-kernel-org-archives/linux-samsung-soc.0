Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfYpdWqd"
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E97D7D56
	for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 17:14:39 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ff26d7c0a6so196431766b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Nov 2023 17:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700788478; x=1701393278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63sQ1AH1I32ffRCwtEtkqR0j31IoAtIR8HssDvXhDlI=;
        b=OfYpdWqdhKiLGydU0JGuj5mBlvhiF5wQdo9F6qORlE5+siMdahtPKUiduC/JdABMl7
         2pb8QWVaTJXwej06raj48IZsK77N9LWWq9OM6R8nAW3EYDVxNwMBry0lt/7DShZBq9zJ
         x/UIzr07yM+Q9XlSqpC9+pRRSzlcgspQERQ2VYCAwkr0At8cszBkHMTkmZCs1TQ7dbOL
         H+ZYjajD4sa443Jl9diemzV8j69CcTVd5mrKWE+jFy2GWa5YTNB03FEj8KoXAUDGIUSY
         ZbSBcrrZdQOFXiul08rR8b/2Ipt3byb+RM08e6CUTG066htf3QbH0VATQ2WQ1NQu2C3s
         Up8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700788478; x=1701393278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63sQ1AH1I32ffRCwtEtkqR0j31IoAtIR8HssDvXhDlI=;
        b=HoMCctdRzOz62Ce387Ol0922nFt0cXyK7aUGNvm5Gd311ftzYu1RYKfcB3CxtHoigJ
         8qxYn8BCsaUI+Z7pssuJ+GSGvxjlvZpMb3Ui6IJ7x3FSZdhw8urEf/9PS/IQc8bylOj5
         PppdodIvVmBewhrWzhybXlnEeMr3TAza9UhYLO/NXffuDt/q8ojQvw1XbpokccSbl2rf
         LUlYnPfhHkFgnrZPlz0L8Yz9ew5DLO9CnDhP7/dro+/9wrPBrSAyIWiZZ2FwflY0ztx3
         lSCDMoV8muTB8sIY9cT5j9xpnKYZZpaHQCB8AIrCCzLa0ttjuax5gL+i1j9a100TONfS
         YvlA==
X-Gm-Message-State: AOJu0YxxsH2GTSU34HnECC62wio/ksAAqoK+9+/sJXCkxHUlmx+ObuZv
	1qP/ZTqKAMloKW/uknKkAaomyD+9fSr7ZeJNY40=
X-Google-Smtp-Source: AGHT+IHLIX9nFgHWswrxl4QhZA1sMO6aysJc8mE548EEq2zaQNtD+vtju8Lr3kfPZInT9eHY959lN4T9+2J71dDRGtk=
X-Received: by 2002:a17:907:1310:b0:a04:8ee8:5e58 with SMTP id
 vj16-20020a170907131000b00a048ee85e58mr574460ejb.45.1700788477971; Thu, 23
 Nov 2023 17:14:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3@epcas1p2.samsung.com>
 <20231120225537.1270358-1-inki.dae@samsung.com>
In-Reply-To: <20231120225537.1270358-1-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Nov 2023 11:14:26 +1000
Message-ID: <CAPM=9txk2nqYykd5shh3Ux7Jff8hweQnhpNUtYmT9nbcKrHdsA@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-fixes
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-samsung-soc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Nov 2023 at 09:00, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Dave and Daniel,
>
>    Two fixups - fixing a potential error pointer dereference and wrong
>    error checking.
Hi Inki,

This fails to build on arm32, and it seems one of the fixes is wrong

[airlied@dreadlord drm-fixes]$ make ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnu- O=3D../../arm-build-fixes/  -j16
make[1]: Entering directory '/home/airlied/devel/kernel/arm-build-fixes'
  GEN     Makefile
      CALL    /home/airlied/devel/kernel/dim/drm-fixes/scripts/checksyscall=
s.sh
  CC [M]  drivers/gpu/drm/exynos/exynos_drm_dma.o
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:
In function =E2=80=98exynos_drm_register_dma=E2=80=99:
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:119:40:
error: passing argument 1 of =E2=80=98PTR_ERR=E2=80=99 makes pointer from i=
nteger
without a cast [-Werror=3Dint-conversion]
  119 |                         return PTR_ERR(-ENODEV);
In file included from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/string.h:9,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-mapping.h:7,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-map-ops.h:9,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:7:
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/err.h:49:61:
note: expected =E2=80=98const void *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99
   49 | static inline long __must_check PTR_ERR(__force const void *ptr)
      |                                                 ~~~~~~~~~~~~^~~
cc1: all warnings being treated as errors

I think it should just be return -ENODEV, since the function returns an int=
.

Please fix it up and resend.

Thanks,
Dave.



>
>    Ps. regarding the first patch, I had sent a GIT-PULL[1] but it seems
>        you missed.
>    [1] https://lore.kernel.org/dri-devel/20231006040950.4397-1-inki.dae@s=
amsung.com/T/#u
>
>    Please kindly let me know if there is any problem.
>
> Thanks,
> Inki Dae
>
> The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b22=
63:
>
>   Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/e=
xynos-drm-fixes-for-v6.7-rc3
>
> for you to fetch changes up to a30ba4bd7cdb5726d86a557c5df8df71c7bc7fad:
>
>   drm/exynos: fix a wrong error checking (2023-11-21 07:41:11 +0900)
>
> ----------------------------------------------------------------
> Two fixups
> - Fix a potential error pointer dereference by checking the return value
>   of exynos_drm_crtc_get_by_type() function before accessing to crtc
>   object.
> - Fix a wrong error checking in exynos_drm_dma.c modules, which was repor=
ted
>   by Dan[1]
>
> [1] https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moro=
to.mountain/
>
> ----------------------------------------------------------------
> Inki Dae (1):
>       drm/exynos: fix a wrong error checking
>
> Xiang Yang (1):
>       drm/exynos: fix a potential error pointer dereference
>
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
>  drivers/gpu/drm/exynos/exynos_hdmi.c    | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)
