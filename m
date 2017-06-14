From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: samsung arm64 soc support?
Date: Wed, 14 Jun 2017 09:04:28 +0200
Message-ID: <CAJKOXPcm8_KCvB=G=7DPN3uBZLfCWbxD88wu+Qk-dL9UK7TPAQ@mail.gmail.com>
References: <CAEQo2v76wd_8==V_XjEuxZj33XBkmFat71vPd0u6CuiW2VgY6A@mail.gmail.com>
 <CAJKOXPfbtr662Fpqh4jVP+vuDHhpc=B0Vfte4XOfv3dhpjfUDg@mail.gmail.com> <CAEQo2v7RU3N=M9=NDN2EXs2u2pctQrg_JqrRCooHhtwbdZkGeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750828AbdFNHEf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 03:04:35 -0400
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com [209.85.223.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6EFE239B5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jun 2017 07:04:29 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id t87so67567085ioe.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jun 2017 00:04:29 -0700 (PDT)
In-Reply-To: <CAEQo2v7RU3N=M9=NDN2EXs2u2pctQrg_JqrRCooHhtwbdZkGeA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?546L5bmz?= <gavin.wang.cd@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, patchwork@m.disordat.com, kgene.kim@samsung.com

On Wed, Jun 14, 2017 at 4:01 AM, 王平 <gavin.wang.cd@gmail.com> wrote:
> thanks for share.
> as we known , to match machine check,there is a machine_start entry .
> such as: DT_MACHINE_START(S3C6400_DT, "Samsung S3C64xx (Flattened Device
> Tree)"), but I can not find exynos5433/exynos7' machine mach entry ? or need
> custormer realize it by ourself？

arm64 kernel code does not use machine_desc structure.

Best regards,
Krzysztof
