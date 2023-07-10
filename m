Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2A3EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jul 2023 07:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjGJHgB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jul 2023 03:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjGJHgB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 03:36:01 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26321EB;
        Mon, 10 Jul 2023 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688974556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pdykm1IEGXCNP+4KYVVXGZUNeBfIgSrmIH45XmqOIEc=;
        b=EoyDf5E+m+C9+A9pRywQm3MugVhoXsP+s6OymqrMQgX2OJhPMy6c+mVR6Bdm/caqBtQ3Df
        PLTlCC/mKX/bsqAStBFfYG0KQiinYLfOB+ass9vBA1M+zjXRcE1rsYw4YK3tv1ko4ZmWTi
        LDSwHW7aHmonwB2/BFY9bCz7Fw/BWrs=
Message-ID: <7672f0b65cf7d2a1bb81019417aa3fa98fbac5e3.camel@crapouillou.net>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos/i9100: Fix LCD screen's
 physical size
From:   Paul Cercueil <paul@crapouillou.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Date:   Mon, 10 Jul 2023 09:35:54 +0200
In-Reply-To: <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
References: <20230708084027.18352-1-paul@crapouillou.net>
         <20230708084027.18352-4-paul@crapouillou.net>
         <98b39071-cbfa-bc58-032e-56f6e9dd5c2a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Le lundi 10 juillet 2023 =C3=A0 08:59 +0200, Krzysztof Kozlowski a =C3=A9cr=
it=C2=A0:
> On 08/07/2023 10:40, Paul Cercueil wrote:
> > The previous values were completely bogus, and resulted in the
> > computed
> > DPI ratio being much lower than reality, causing applications and
> > UIs to
> > misbehave.
> >=20
> > The new values were measured by myself with a ruler.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > Fixes: 8620cc2f99b7 ("ARM: dts: exynos: Add devicetree file for the
> > Galaxy S2")
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
>=20
> This does not apply. You rebased your work on some older
> version/tree,
> without new layout. Please work on linux-next.

This patchset was based on drm-misc-next, because that's where I was
planning to apply it; and it was extremely unlikely (but not
impossible, apparently) that the i9100.dts would be modified in the
meantime.

I can rebase on linux-next, the problem then is that I then don't know
how/where to apply the patchset.

Cheers,
-Paul
