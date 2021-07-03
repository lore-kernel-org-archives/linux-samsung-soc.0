Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDC9C07E97
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Jul 2021 09:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ED876143E
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  3 Jul 2021 09:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhGCJCi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 3 Jul 2021 05:02:38 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:40434 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhGCJCi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 3 Jul 2021 05:02:38 -0400
Date:   Sat, 03 Jul 2021 09:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1625302803;
        bh=bh7EqPBSxD7P0sFIwjUGPVXk5inH7QT2SLxv4vJUnxM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=uKToOwdJAXk/AVaBEn+cTXOICdi8xkNcy99a/jle7KDl2C/uUR21XDBgTQXZ/UhQH
         3rNoExoJaLw8yoB2rhCXAfb8kJJ8tnX9ouE5qEWyn0nblI/zD7lM3btLFqnzaSlq7z
         25qB6N+e4aEdrL2hIMzoqRSC8Yhya0tv9UzyTwbg16N2r7Qg+tIX959cC80NTAXLfi
         ysVmtIRvdzeyya//7XvBdQIPn4RcRDHJtjoZs8HdTnb6EhOhSN7qoTWTMOoHTjy43p
         vggHDpukZ8RjVcyuG7cS+CpJdGw36Nlk+9DBGrRqAKipWyZBUzvDJFi2dLHQJMxYwr
         cdR1lQug1hCdQ==
To:     gushengxian <gushengxian507419@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
        yuq825@gmail.com, linux-samsung-soc@vger.kernel.org,
        lima@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        gushengxian <gushengxian@yulong.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] include/uapi/drm: fix spelling mistakes in header files
Message-ID: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <20210703072502.646239-1-gushengxian507419@gmail.com>
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Reviewed-by: Simon Ser <contact@emersion.fr>

But this this touches a lot of different drivers, not sure we can just
merge this via drm-misc-next?

In any case, please ping me again in a week if this hasn't been merged
by then.
