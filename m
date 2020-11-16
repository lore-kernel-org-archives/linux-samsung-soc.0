Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A434C55ABD
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 09:50:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5651322314
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 Nov 2020 09:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgKPJJI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 Nov 2020 04:09:08 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:47490 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728531AbgKPJJH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 04:09:07 -0500
Date:   Mon, 16 Nov 2020 09:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail2; t=1605517742;
        bh=XOpmtLA3FG1YGAzJZFjIARQk+2d0fPgiu9VeeIFRjRg=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=axaIo0NS/A15x+KQfoo2hBLjMaH7iDv5lOrXQkchq0679GP4frWdguTYltCFIvHCB
         9gczUFxXCwQVLzDdKcNYsvP9XHjKAgGVdtyU2MkGVVZFZjMYYy1oaQ0StW5Oob/UTb
         0UVt/9TVDw+7KwlL+F4ADKON/CUsGstm+zsoqQ/+QNyAqcs1CeXnobbxhooiVxV45i
         CWz3WIuvVwMYE0fb5alRkoPioGVhFT/vcwg18jv6SFA8l/dHj2HMhN4kF2EK+YikD0
         PTebkDyDcdToTp6n2vQrnqGihZ7mFKLWGKpUiWFwQpQi1y0YQeZHmPYAVkvVasRMkR
         kd1WSbWxfZDKA==
To:     Marek Szyprowski <m.szyprowski@samsung.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [v2,1/2] drm: convert drm_atomic_uapi.c to new debug helpers
Message-ID: <9Kr7KSkpWU_eo1ALXztw7ryOMnXwGVye3q_RK-hjpjRGpkdqcq_nVROg8C3OXF3jPxMMOB3XeLrSri8XG0h6IoC-5uyV2JwztiaGZK6gGqw=@emersion.fr>
In-Reply-To: <87bba2ec-b044-66c8-1fd7-4c01a9e5b791@samsung.com>
References: <FpVdsmqIh7IkH7YIwBjmp5ict1qi4NZlwHrIps@cp4-web-034.plabs.ch> <CGME20201116090608eucas1p128a4fa2e03380fe0cffea2f9bc2af816@eucas1p1.samsung.com> <87bba2ec-b044-66c8-1fd7-4c01a9e5b791@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Monday, November 16, 2020 10:06 AM, Marek Szyprowski <m.szyprowski@samsu=
ng.com> wrote:

> This patch landed in today's linux-next as commit e3aae683e861 ("drm:
> convert drm_atomic_uapi.c to new debug helpers"). Sadly it breaks
> booting all Exynos based boards. Here is example of the panic log:

Sorry for the inconvenience, my tests didn't trigger this code-path.
I pushed a fix for this in drm-misc-next: 0003b687ee6d ("drm: fix oops
in drm_atomic_set_crtc_for_connector").
