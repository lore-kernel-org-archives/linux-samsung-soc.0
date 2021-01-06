Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8265FC433E6
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 06:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39BBD230FB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 06:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726238AbhAFGxj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jan 2021 01:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbhAFGxj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jan 2021 01:53:39 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FF4C06134D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jan 2021 22:52:58 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw4so3629761ejb.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jan 2021 22:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oZy7Sz3n8S2tjruUbeBIOImdiAfddQyS0bUKqfEICmE=;
        b=0/uMMMlT9Lx/HzqYctXAj/Uxouwkgdk3F/F4OzQtqUaoOgrTiIDJe5GgPjJ2xgYN/c
         4joRS04ju2a4w0/C/AA25vChYFrJ7zbJH0H395SowwwCpIqJTrvKKtFu0COtttHqCz39
         BoHtBJsXde9ak0/BRF6emuWGs4llvyZrFTKI9rSm1LYKAnYGTZcaPG9lzTL5snyQAL0j
         ldKIepsLcmv024Q8/vuy04pxKJQ17tz922AmzcGr1H1a0nboBKIfK0LLpVF4+NDFq5fI
         CCYOAZuea04kxgfWaZNaIlIsxg7+I4moxxZaxAy1q2IrXgiSMpfsu8oEfOeDCLGYdSdQ
         SLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oZy7Sz3n8S2tjruUbeBIOImdiAfddQyS0bUKqfEICmE=;
        b=Vopw3y5MOXNqxAJh7sXbLYCF/BSkIrZLxwPG6dZIXLTR8Zi4AYplsmrtSK0RUwhL6P
         qmTaAc2DIW8nwLyhuYCTYevf5rMi1EUWGZFUivYiMSPHIJ3Wgic1Y+iCzOxw/A/vt6Je
         1vXaRoiUmQIN9wPlx+IgR73T9dR6EG9aTOXry9HhgvQHdJ5tYffr1Aqu/qq2JUc2aHhO
         /i75+y8TMNBjiseebwzTZY4PBIG4CV4YEcSDQW7wckoHM052n2a/uV+NXrOlSVkgqkVx
         iqUcvf0MdoxW0x6WYOBWDyC2ie1SyillVtqb1ZtiwFk1say4f8drU7+UnbWEKSjoftjr
         V3wA==
X-Gm-Message-State: AOAM533EnUmbVgkoLzR4pffIGRqWRjVL0Y4/7UI9i7p3IZLxcGlmwcMk
        rwgsisW6iLQXmIFF9z+xv/euoG45mgMe/08LaWaAOg==
X-Google-Smtp-Source: ABdhPJxhuEdFiLL8OlB/BKiBZF2UBI0qZrNJKksEz3v3W/m4HgQMMVhdmLyoeNxuQhx7G1/99BvqJYCE7ZyNSs997yU=
X-Received: by 2002:a17:907:b09:: with SMTP id h9mr1967943ejl.155.1609915977620;
 Tue, 05 Jan 2021 22:52:57 -0800 (PST)
MIME-Version: 1.0
References: <20210105134424.30632-1-brgl@bgdev.pl> <202101061453.E7YDzBDz-lkp@intel.com>
In-Reply-To: <202101061453.E7YDzBDz-lkp@intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 07:52:46 +0100
Message-ID: <CAMpxmJUxKD9-J+MESZMxMePZX4WO_QFj6FudrAKS=Tp_kW8iOQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
To:     kernel test robot <lkp@intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        LKML <linux-kernel@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 6, 2021 at 7:47 AM kernel test robot <lkp@intel.com> wrote:
>
> Hi Bartosz,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on abelloni/rtc-next]
> [also build test WARNING on v5.11-rc2 next-20210104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/rtc-s5m-use-devm_i2c_new_dummy_device/20210105-214736
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
> config: x86_64-randconfig-a004-20210105 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c951623bc8965fa1e89660f2f5f4a2944e4981a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # https://github.com/0day-ci/linux/commit/21651184178d1001f3bbc858c9161f1b7fd65321
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Bartosz-Golaszewski/rtc-s5m-use-devm_i2c_new_dummy_device/20210105-214736
>         git checkout 21651184178d1001f3bbc858c9161f1b7fd65321
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/rtc/rtc-s5m.c:773:4: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
>                            ret);
>                            ^~~
>    include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_err'
>            _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                          ^~~~~~~~~~~
>    drivers/rtc/rtc-s5m.c:719:9: note: initialize the variable 'ret' to silence this warning
>            int ret, alarm_irq;
>                   ^
>                    = 0
>    1 warning generated.
>
>
> vim +/ret +773 drivers/rtc/rtc-s5m.c
>

This isn't caused by this patch, it seems to be an older bug. I can
try to fix it while at it.

Bart
