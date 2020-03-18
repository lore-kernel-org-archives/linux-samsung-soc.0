Return-Path: <SRS0=f9pd=5D=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F37C1975A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Mar 2020 02:17:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E88220738
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 18 Mar 2020 02:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eri3E0pc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgCRCRy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Mar 2020 22:17:54 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:41226 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgCRCRy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Mar 2020 22:17:54 -0400
Received: by mail-oi1-f172.google.com with SMTP id b17so9184705oic.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Mar 2020 19:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XU33WwkXD0BKNUHEBeawwcVOr7NO52b7Q9Wfl473unU=;
        b=Eri3E0pc00RVqx53R/HGK7DIWlYIeCFq9X9hhmYugYpj3BXDspzYH021PskOCK576g
         tzzh3/2dMPpMFSbHzmyAwoJNexW32vC9cyM0bu7sJ0RYOcbEIBbjl1V8kqnp6OUEm7tN
         ZS+fTuyiWHJNopNYxx3X21AfDg8EZt1OXcFimEye5KYcHopkdnOlQDSNY3SDGqePGsQ2
         nQBMcj4nJn52d4LoAD9LxnH2Ug7/tPmuw7Jco0EKmx3OgnG3wy89hwVK3pt2TQ7xvEwn
         /HkKDNaelKAZ67mtT4wA7F/kLwrsv2eK922LmcAuguIpZBO+VeyMTWRxvP8md/0vvK0r
         p++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XU33WwkXD0BKNUHEBeawwcVOr7NO52b7Q9Wfl473unU=;
        b=N5WDMgugLPIGe3PYJkRShP8OrKLoeSzgAKbLufnDLVatdmJa7nF2lJ8kiyVQ1t2Rww
         0HpixvqueIj20EEKA/V7I2bZC1dXHHgFSOHFAs3UM48UW/DmPtqpEJZXI48vqVN4+qp7
         //nW4kDvtvDQ6/dQW985/T3L1jIvA9N/UKE5PLrAt6epL6FqyOUtGpLc74/3wE0eM8NZ
         CkRMMY8IBYdprF1wnB3DNCsANCehPIzgxEi/lKB2gqUCiQOr5mU3KNhamsQavbd+FzWT
         kpzbCPMu7bJ06NJvy6hr9u6wpWnaOuiGPjcnzE007LI7MLqCv0Sc6voWB6lWVzh3UgLt
         SX1w==
X-Gm-Message-State: ANhLgQ33wq55dJIl53MR/leTBCL7IeIRNWh56NQ3qBXEyK73AfvuI+Lv
        zFvBbrz8MwLntr0rolnN4oVdqaTXHrftR7GlFIO0VQ==
X-Google-Smtp-Source: ADFU+vuDta7z67KicNE0COfJQoW2Bh+5Qz71x/Iv2ZlzgKYwAzyvni/PHNYSIGFyNfrtXaEGft/iuWTUjt3sZla0yHc=
X-Received: by 2002:aca:f0d7:: with SMTP id o206mr1441237oih.41.1584497872923;
 Tue, 17 Mar 2020 19:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200316010443epcas1p33627ec18d70b980b7a5c943de8cfa07d@epcas1p3.samsung.com>
 <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
In-Reply-To: <1584320957-9442-1-git-send-email-inki.dae@samsung.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Wed, 18 Mar 2020 12:17:41 +1000
Message-ID: <CAPM=9tzrQM4CiFNZDmyDFLC7ODyZVD-O9vmiJw4myPmz3HoAEA@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-next
To:     Inki Dae <inki.dae@samsung.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This seems to contain a exynos drm fixes backmerge, please don't do
that without a headsup.

Can you send one without that or do you need a fixes backmerge, if so
please request me to do that first, then rebase this and send it.

Dave.

On Mon, 16 Mar 2020 at 11:04, Inki Dae <inki.dae@samsung.com> wrote:
>
>         Just two cleanups - one is to mask encoder bitmask using
>         drm_encoder_mask(), and other is to use mode->clock
>         instead of calculating it again.
>
>         Please kindly let me know if there is any problem.
>
> Thanks,
> Inki Dae
>
> The following changes since commit 69ddce0970d9d1de63bed9c24eefa0814db29a=
5a:
>
>   Merge tag 'amd-drm-next-5.7-2020-03-10' of git://people.freedesktop.org=
/~agd5f/linux into drm-next (2020-03-13 09:09:11 +1000)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/e=
xynos-drm-next-for-v5.7
>
> for you to fetch changes up to 0c9a609ca444298e438ee9c6daaf53c14277f1ad:
>
>   drm/exynos: Use mode->clock instead of reverse calculating it from the =
vrefresh (2020-03-16 09:50:28 +0900)
>
> ----------------------------------------------------------------
> Two cleanups
> . Replace the hand rolled encoder bitmask thing with drm_encoder_mask()
> . Use mode->clock instead of reverse calculating it from the vrefresh
>
> ----------------------------------------------------------------
> Inki Dae (1):
>       Merge tag 'exynos-drm-fixes-for-v5.6-rc5-v2' of git://git.kernel.or=
g/.../daeinki/drm-exynos into exynos-drm-next
>
> Marek Szyprowski (1):
>       drm/exynos: Fix cleanup of IOMMU related objects
>
> Ville Syrj=C3=A4l=C3=A4 (2):
>       drm/exynos: Use drm_encoder_mask()
>       drm/exynos: Use mode->clock instead of reverse calculating it from =
the vrefresh
>
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +++--
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  7 ++++---
>  drivers/gpu/drm/exynos/exynos_drm_dma.c       | 28 ++++++++++++++++++---=
------
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  5 ++---
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 ++++--
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +++--
>  drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++++--
>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++++--
>  12 files changed, 56 insertions(+), 33 deletions(-)
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
