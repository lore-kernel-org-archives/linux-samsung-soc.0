Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 601CAC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 07:01:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18FDC230FB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jan 2021 07:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbhAFHAo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jan 2021 02:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbhAFHAo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jan 2021 02:00:44 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F00C06134D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jan 2021 23:00:03 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id g24so3413034edw.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jan 2021 23:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kv8nRLjsuAcXnyWTXClR33zRdQK5e2NXZzdyNIims3Q=;
        b=Ep667Y43ujaKVx164XzHCTohfcQ4r4/MKoExyrY+vNzJtIXNtMpPRkKmt82M9mFF1t
         hsU0hJErGIRaP8DdxFhpSOxFrxnvG2XBobctghB/5v7rfHexAjkPNhPerrIfrzR1EE0c
         SxEJT08IhO5ZkJIOhzQSn2bd80fOoAQvKM1wAk/hRiAppIhyydQPo1281SronJtx16n5
         KroWsfzTiWgIxJesSjTehkmgiquqZYRPNQzBkH9FOk1hMZl0QVxUKgyS+htFOaAHhzKP
         Hj3lvDT/TotGAojz8b/Z1ayD2FP7D0DJ6LB22Ejrpx/34SAq4V+2gzRWZPB64drWk6Ca
         LOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kv8nRLjsuAcXnyWTXClR33zRdQK5e2NXZzdyNIims3Q=;
        b=tpkQSbQoINOBfz5ZamU1lyTWtYlf3/JbCCXbx62EJ4K1yZrOmPM6fAU5CE5w57BhN/
         K9neG7I7PYikClVXMh7f+SoziZF04YmsQvHVFOpSb3jnKnRIHXjSNEJdevHTpDasjXcS
         JYdfpKXZA50nkpgPtKopeqCcbuaDIGOw8dRNlfJ9F9I/L2LN8xa5FGYH2fH3wj597xGg
         08F7ChNfOmjSt1PMtNgZyV7Env5+yKPuNaFji6wEp+ntqppeaHqAt0a910DZLT3VmU13
         G4vWMWnV3zyViJt6i8ASL3ysyOFxmyhVeY4JOd1nx1IQj1Rrt+R/87P+M1tJw5MeSiBL
         Yeww==
X-Gm-Message-State: AOAM532+7X3wksLrANoXC2AXnbeHyLLTOjBg1EbFxbWzMYMjat6Wcinw
        W6YDHYKKAQEm3SO0E+PjiRLg+5nthdTnvNKI7Jk8gA==
X-Google-Smtp-Source: ABdhPJymhgWMXrAR6nWVrqZyrUQA9tMhZQPqDfwh0sx7t1nuxzUe+qPC7O/2f99QbynfpbcTX84SnPEjIACfBeWPUk8=
X-Received: by 2002:a05:6402:17:: with SMTP id d23mr3003595edu.341.1609916402398;
 Tue, 05 Jan 2021 23:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20210105134424.30632-1-brgl@bgdev.pl> <202101061453.E7YDzBDz-lkp@intel.com>
 <CAMpxmJUxKD9-J+MESZMxMePZX4WO_QFj6FudrAKS=Tp_kW8iOQ@mail.gmail.com>
In-Reply-To: <CAMpxmJUxKD9-J+MESZMxMePZX4WO_QFj6FudrAKS=Tp_kW8iOQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 6 Jan 2021 07:59:51 +0100
Message-ID: <CAMpxmJXca8Wc0Fwod+mESC6cee5SEamyN6ayj1AqFQJBHVqQ3A@mail.gmail.com>
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

On Wed, Jan 6, 2021 at 7:52 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Jan 6, 2021 at 7:47 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Bartosz,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on abelloni/rtc-next]
> > [also build test WARNING on v5.11-rc2 next-20210104]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/rtc-s5m-use-devm_i2c_new_dummy_device/20210105-214736
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
> > config: x86_64-randconfig-a004-20210105 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c951623bc8965fa1e89660f2f5f4a2944e4981a)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://github.com/0day-ci/linux/commit/21651184178d1001f3bbc858c9161f1b7fd65321
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Bartosz-Golaszewski/rtc-s5m-use-devm_i2c_new_dummy_device/20210105-214736
> >         git checkout 21651184178d1001f3bbc858c9161f1b7fd65321
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/rtc/rtc-s5m.c:773:4: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
> >                            ret);
> >                            ^~~
> >    include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_err'
> >            _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> >                                          ^~~~~~~~~~~
> >    drivers/rtc/rtc-s5m.c:719:9: note: initialize the variable 'ret' to silence this warning
> >            int ret, alarm_irq;
> >                   ^
> >                    = 0
> >    1 warning generated.
> >
> >
> > vim +/ret +773 drivers/rtc/rtc-s5m.c
> >
>
> This isn't caused by this patch, it seems to be an older bug. I can
> try to fix it while at it.
>
> Bart

-ETOOEARLY actually it's my bad, I'll fix that in v3.

Bartosz
