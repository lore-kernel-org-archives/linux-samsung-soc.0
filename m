Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3010DC38A2D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 Oct 2022 07:29:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234635AbiJ0H3Q (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 Oct 2022 03:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiJ0H3P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Oct 2022 03:29:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336EBAB82B
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Oct 2022 00:29:14 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id q9so2183562ejd.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Oct 2022 00:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HDqlrmcOi6ROmlFz0qtu3ygn7DfpcbBtZ6O9GxQZG1Q=;
        b=rrmU1An1rGASw6GEQxKdwjv2fRO2As/jMf50+8IJhNExD+UK21luDqNgQBxBLkK22d
         Lmulr3So4uCEtH8wSx/eyz54kQppCd77vqU+KMzwF6yn4lRyui4hE4qIiSPSsF0xm87M
         sY2QpEZ3d5Y6aSbXGmY4vjV6YtcEA4jA1hqolz1hPV0du4LDfEKMV5q+mCh8fTcDjyrg
         IISTjwLFM7JeFBvpra6PcWVIAumLUIvs68uPGfaeRlAP1T5+LZUXuhVwa/HxM2Cv7bNm
         TWwNyaiPDHW9pbx0LT/6IzB67W7/LC2nnL09F2lZ9t5c9Bx4BHLUpSpUV3u68SIPObrY
         OKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HDqlrmcOi6ROmlFz0qtu3ygn7DfpcbBtZ6O9GxQZG1Q=;
        b=wIRscdgrJQ1pVVWGTqmhmP6eUeSJ26XPYSgEGO698oeU1vHUzeTi7ccOEom5+wf+OZ
         h77ajsqsHYLUkFFMFyUL4Lx6F/nSp1tIauMoA2REQcfyvv0CC8ra29tmAjEVM5k//u1p
         iGaE0c+gpfRSyfeeDfvYObU9TGajbvD/Vl35yzhyhF0O7R8jk6KSgKk+2xmp4p+mD977
         CSHHqfcOtMDYjcd+fWcYUfBmcNQdBfO+4mo8b7sT7bnJyWRYck0j8tqZca4x+RQhp0Le
         KLawQWMW6aYHDCjWFIQyy64tqFxoaLQEugmAvTqivl0Xdx7SYy8VmtG6lPV60WltjGrk
         m3dg==
X-Gm-Message-State: ACrzQf3KAwavQKYQxQJ7U24gJA+gG14sRgywVkRgUsHtgf0tP30gjL2r
        QpnVpWY7crbmtkloqCv+udcnE8UOOeRtniw1larl/yQahclyPA==
X-Google-Smtp-Source: AMsMyM5A2BEhkdmq2nGU2SIWLPg4S8heJB3zJgGmGv5I9btjdfBbrjxhoSVscSznC9ae4o6mLklyPbeRVgIdZx+xOM0=
X-Received: by 2002:a17:907:6e1b:b0:78e:15a3:5be6 with SMTP id
 sd27-20020a1709076e1b00b0078e15a35be6mr41422255ejc.750.1666855752547; Thu, 27
 Oct 2022 00:29:12 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 27 Oct 2022 12:59:01 +0530
Message-ID: <CA+G9fYvvtyO8fsYQb25L+bLXUnHJ5LoFToD+cYbKCcE6JUk5FQ@mail.gmail.com>
Subject: s3c6400_defconfig: arch/arm/mach-s3c/mach-crag6410.c:183:12: error:
 use of undeclared identifier 'KEY_VOLUMEUP'
To:     patches@opensource.cirrus.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Following build warnings / errors noticed while building arm s3c6400_defconfig
with clang tool chain.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang'
'CC=sccache clang'
arch/arm/mach-s3c/s3c64xx.c:430:9: warning: The platform is deprecated
and scheduled for removal. Please reach to the maintainers of the
platform and linux-samsung-soc@vger.kernel.org if you still use
it.Without such feedback, the platform will be removed after 2024.
[-W#pragma-messages]
#pragma message "The platform is deprecated and scheduled for removal. " \
        ^
1 warning generated.
arch/arm/mach-s3c/mach-crag6410.c:183:12: error: use of undeclared
identifier 'KEY_VOLUMEUP'
        KEY(0, 0, KEY_VOLUMEUP),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:184:12: error: use of undeclared
identifier 'KEY_HOME'
        KEY(0, 1, KEY_HOME),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:185:12: error: use of undeclared
identifier 'KEY_VOLUMEDOWN'
        KEY(0, 2, KEY_VOLUMEDOWN),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:186:12: error: use of undeclared
identifier 'KEY_HELP'
        KEY(0, 3, KEY_HELP),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:187:12: error: use of undeclared
identifier 'KEY_MENU'
        KEY(0, 4, KEY_MENU),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:188:12: error: use of undeclared
identifier 'KEY_MEDIA'
        KEY(0, 5, KEY_MEDIA),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:190:12: error: use of undeclared
identifier 'KEY_DOWN'; did you mean 'SM_DOWN'?
        KEY(1, 1, KEY_DOWN),
                  ^~~~~~~~
                  SM_DOWN
include/linux/input/matrix_keypad.h:15:8: note: expanded from macro 'KEY'
                                 ((val) & 0xffff))
                                   ^
include/linux/console.h:29:2: note: 'SM_DOWN' declared here
        SM_DOWN,
        ^
arch/arm/mach-s3c/mach-crag6410.c:191:12: error: use of undeclared
identifier 'KEY_LEFT'
        KEY(1, 2, KEY_LEFT),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:192:12: error: use of undeclared
identifier 'KEY_UP'
        KEY(1, 3, KEY_UP),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:193:12: error: use of undeclared
identifier 'KEY_RIGHT'
        KEY(1, 4, KEY_RIGHT),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:194:12: error: use of undeclared
identifier 'KEY_CAMERA'
        KEY(1, 5, KEY_CAMERA),
                  ^
arch/arm/mach-s3c/mach-crag6410.c:199:17: error: invalid application
of 'sizeof' to an incomplete type 'uint32_t[]' (aka 'unsigned int[]')
        .keymap_size    = ARRAY_SIZE(crag6410_keymap),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                               ^~~~~
arch/arm/mach-s3c/mach-crag6410.c:210:11: error: use of undeclared
identifier 'KEY_SUSPEND'
                .code   = KEY_SUSPEND,
                          ^
arch/arm/mach-s3c/mach-crag6410.c:212:11: error: use of undeclared
identifier 'EV_KEY'
                .type   = EV_KEY,
                          ^
arch/arm/mach-s3c/mach-crag6410.c:217:11: error: use of undeclared
identifier 'SW_FRONT_PROXIMITY'
                .code   = SW_FRONT_PROXIMITY,
                          ^
arch/arm/mach-s3c/mach-crag6410.c:219:11: error: use of undeclared
identifier 'EV_SW'
                .type   = EV_SW,
                          ^
arch/arm/mach-s3c/mach-crag6410.c:225:14: error: invalid application
of 'sizeof' to an incomplete type 'struct gpio_keys_button[]'
        .nbuttons       = ARRAY_SIZE(crag6410_gpio_keys),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/kernel.h:55:32: note: expanded from macro 'ARRAY_SIZE'
#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                               ^~~~~
17 errors generated.
make[3]: *** [scripts/Makefile.build:250:
arch/arm/mach-s3c/mach-crag6410.o] Error 1

Build compare results
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221027/testrun/12686125/suite/build/test/gcc-8-s3c6400_defconfig/history/

Build log:
https://builds.tuxbuild.com/2GhZbWVKwBdCV4AryWkU6kAZ37i/

--
Linaro LKFT
https://lkft.linaro.org
