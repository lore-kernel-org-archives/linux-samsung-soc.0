Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05ACEC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Dec 2020 16:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3ED823124
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Dec 2020 16:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbgLVQIo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Dec 2020 11:08:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727432AbgLVQIo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 11:08:44 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E652EC0613D3;
        Tue, 22 Dec 2020 08:08:03 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id d20so12358350otl.3;
        Tue, 22 Dec 2020 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5mhuNOKxkmBBrmIsUzS9fwD7Nuv7mqMKloOUqDCzlT8=;
        b=PVUKWx0s5bxl/Eh9d3rMm1aOJZm1w8O8u1DH6W4E4WjZP+EGdw9SRW/TBmXYslgxCi
         zATFwj44Ww7EuOtXpBWG9og2xSNsaWefpledBqorUarQ+XOiWw4unc97g/YsxGMF/bWA
         eS1ZQ/9470ynzhkGTPa7HUpnRoyIaHdoYpoVIRlLjUKGMpFgntSsn6mjmMufA/lHEAnl
         9/r3Sw/LGTaEGmmidMNRobzWnJKNaRaaQLk9dudhD5R5nvGxIvz5fE2UWeWRI1AK1P2w
         Kk+LfocyJj0Z83Dkb3ALYkyNo0yErh7UC8scViKP10YOLOMc6DM2sgQfAwp22ThrgjfK
         vnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5mhuNOKxkmBBrmIsUzS9fwD7Nuv7mqMKloOUqDCzlT8=;
        b=RfWvwyQWpUO9PI5NScs6y+e3bWR4YJlyBICKd+hnnGpOHiIV4788oW8IHH2fTA1CvW
         5baMXw1M47jwAeKdb9e7zCBpVCMmX3LxwHLfvZDjk+eKh7+7m2DFInHh5n5Vi/Pn77WY
         O8Pu0bbymTdcJ2CwDC6ki6qx2wYnAOLmH7iuJt1S+yibwiDxXiXColaKm/Jz/nQ+lR83
         I0pGkm6qU+uqDqevnUnovXqBluYBQOG1HXXpKJoav27jOqkOcAtq5ghp0iXXAx11XZ+p
         UBsANUO3Q+bp5UpDp4bWhS3PDzo/T3TpWXIa+NH2pT1rTu1U8cIWoW0ZzvYZXgz+MVl1
         XidA==
X-Gm-Message-State: AOAM531d9GlNVf5JxcgtbY8O4YObOlGYkqDqau2makUUtI8iaQCjK10y
        LKg3qEHuDEHRS92q7T8xpX9+pfgNTG8xsn//D8M=
X-Google-Smtp-Source: ABdhPJwqSycFpxX9Jz7U16TejFgMqh1yhHCGmKgIfuXWwA9aEHG/qyeZHSoqcZhDg2nkpc80bEAesVHCPShEHxndzP0=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr16278124otc.145.1608653283153;
 Tue, 22 Dec 2020 08:08:03 -0800 (PST)
MIME-Version: 1.0
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch> <20201127164131.2244124-5-daniel.vetter@ffwll.ch>
In-Reply-To: <20201127164131.2244124-5-daniel.vetter@ffwll.ch>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Tue, 22 Dec 2020 18:07:36 +0200
Message-ID: <CAFCwf12yMvw8t_RvxDweWVQFfQLE=S8UAiMwTALQ-nvVyx=psA@mail.gmail.com>
Subject: Re: [PATCH v7 04/17] misc/habana: Use FOLL_LONGTERM for userptr
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pawel Piskorski <ppiskorski@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 27, 2020 at 6:42 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> These are persistent, not just for the duration of a dma operation.
>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> Cc: Jan Kara <jack@suse.cz>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: linux-mm@kvack.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: Oded Gabbay <oded.gabbay@gmail.com>
> Cc: Omer Shpigelman <oshpigelman@habana.ai>
> Cc: Ofir Bitton <obitton@habana.ai>
> Cc: Tomer Tayar <ttayar@habana.ai>
> Cc: Moti Haimovski <mhaimovski@habana.ai>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Pawel Piskorski <ppiskorski@habana.ai>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/misc/habanalabs/common/memory.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/habanalabs/common/memory.c b/drivers/misc/haban=
alabs/common/memory.c
> index 2c59fa869684..0d25ae1d5f3e 100644
> --- a/drivers/misc/habanalabs/common/memory.c
> +++ b/drivers/misc/habanalabs/common/memory.c
> @@ -1296,7 +1296,8 @@ static int get_user_memory(struct hl_device *hdev, =
u64 addr, u64 size,
>         if (!userptr->pages)
>                 return -ENOMEM;
>
> -       rc =3D pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE=
,
> +       rc =3D pin_user_pages_fast(start, npages,
> +                                FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
>                                  userptr->pages);
>
>         if (rc !=3D npages) {
> --
> 2.29.2
>

Hi Daniel,
Is this patch-set going to be in 5.11 ?
If not, can I just pick the two patches relevant to my driver and push
them through my tree ?

Thanks,
Oded
