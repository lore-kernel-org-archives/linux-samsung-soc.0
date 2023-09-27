Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F9AE810DB
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Sep 2023 12:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbjI0MQu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbjI0MQu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 08:16:50 -0400
X-Greylist: delayed 428 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 27 Sep 2023 05:16:43 PDT
Received: from m1-bln.bund.de (m1-bln.bund.de [77.87.224.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AEC7139
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Sep 2023 05:16:43 -0700 (PDT)
Received: from m1-bln.bund.de (localhost [127.0.0.1])
        by m1-bln.bund.de (Postfix) with ESMTP id 8EBEEAB5C1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Sep 2023 14:09:33 +0200 (CEST)
Received: (from localhost) by m1-bln.bund.de (MSCAN) id 6/m1-bln.bund.de/smtp-gw/mscan;
     Wed Sep 27 14:09:33 2023
X-NdB-Source: NdB
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; d=itzbund.de;
        s=230316-2017-ed25519; t=1695816564;
        bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
        h=Date:From:To:Subject:MIME-Version:Content-Type:
         Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
         Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
         Reply-To:Resent-To:Sender:Subject:To;
        b=el5pAED/N/u2BgLg3kW9pQRSJahfIqUFOcvts3Xq0+CRTjjTiXJLxZdz3CBDMlKpd
         nVHv/IO3Ek4TaWRQJa/Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itzbund.de;
        s=230316-2017-rsa; t=1695816564;
        bh=NuCL+Ul/0dtzEbUBik1/xqBHCY4XgXXsKJePOuodXgc=;
        h=Date:From:To:Subject:MIME-Version:Content-Type:
         Content-Transfer-Encoding:Autocrypt:Cc:Content-Transfer-Encoding:
         Content-Type:Date:From:In-Reply-To:Mime-Version:Openpgp:References:
         Reply-To:Resent-To:Sender:Subject:To;
        b=B7JTFG8qXmYh9wYi/rdK50M1+v7GD/k4kFmBQtv06EjDU5PNCGvD+dgaOq/Iv9x3h
         Dh6FtLSXzRpl9JuYuQ5RHLOSYmzeSq+l8k9IdvrMhfn2ZqO/UhXvTELjqmsrAXm7rA
         EBMrJQs9M+4tW2abRtAF1ylHqbmxofsJsCGK8Psi/PmhTFAnwloG8OxaMOoLd3Uziq
         HXi6+Ri1laFWOOwr4VALXMbJ3uquTX4TkuRcXej4ql7XYBX0Q9dkh1FqLGmu1H5dpQ
         +Rj70T12JdySusaUrATFgWIQPe3GJ3An4XB/cD6A/ezMft+r0ibcJSbt86j/r1/vad
         mYiSjy9RfqJWQ==
X-P350-Id: 28a0dba10b1412d2
Date:   Wed, 27 Sep 2023 14:09:23 +0200
From:   E-Mail-Administration ITZBund <noreply@itzbund.de>
To:     linux-samsung-soc@vger.kernel.org
Subject: Ihre E-Mail konnte nicht zugestellt werden
Message-ID: <20230927120923.GA4303@vlp22140.prod.groupware.itz.itzbund.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Rusd: domwl, Pass through domain itzbund.de
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Sehr geehrte Damen und Herren,

bitte antworten Sie nicht auf diese Benachrichtigung. Kontaktm=F6glichkeite=
n entnehmen Sie bitte der E-Mail-Signatur.

Aufgrund eines Zertifikatsproblems auf einem Antivirus-Gateway des ITZBund =
konnten E-Mails nicht zugestellt werden. Diese Nachrichten sollten daher no=
ch einmal versendet werden.

Sie erhalten diese Benachrichtigung, da Ihre E-Mail-Adresse in einer der fr=
aglichen Nachrichten enthalten war. Nachfolgend finden Sie die Einzelheiten=
 zu dieser E-Mail:

Datumsstempel: 25.09.2023 11:48

Absender: joro@8bytes.org
Empf=E4nger: samuel@sholland.org, mpe@ellerman.id.au, christophe.leroy@csgr=
oup.eu, orsonzhai@gmail.com, jsnitsel@redhat.com, angelogioacchino.delregno=
@collabora.com, linux-sunxi@lists.linux.dev, matthias.bgg@gmail.com, digetx=
@gmail.com, yong.wu@mediatek.com, jonathanh@nvidia.com, linux-arm-kernel@li=
sts.infradead.org, mjrosato@linux.ibm.com, jernej.skrabec@gmail.com, baolu.=
lu@linux.intel.com, krzysztof.kozlowski@linaro.org, jgg@nvidia.com, thierry=
=2Ereding@gmail.com, alim.akhtar@samsung.com, will@kernel.org, m.szyprowski=
@samsung.com, nicolinc@nvidia.com, linux-mediatek@lists.infradead.org, ande=
rsson@kernel.org, agross@kernel.org, linux-tegra@vger.kernel.org, linuxppc-=
dev@lists.ozlabs.org, extern.martin.grimm@itzbund.de, treding@nvidia.com, k=
onrad.dybcio@linaro.org, baolin.wang@linux.alibaba.com, npiggin@gmail.com, =
kevin.tian@intel.com, linux-s390@vger.kernel.org, linux-samsung-soc@vger.ke=
rnel.org, linux@armlinux.org.uk, zhang.lyra@gmail.com, steven.price@arm.com=
, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-rockchip@lis=
ts.infradead.org, iommu@lists.linux.dev, vdumpa@nvidia.com, heiko@sntech.de=
, linux-arm-msm@vger.kernel.org, robin.murphy@arm.com, wens@csie.org, robdc=
lark@gmail.com

Betreff: 'Re: [PATCH v8 00/24] iommu: Make default_domain's mandatory'

Sollten Sie der Absender sein, so erw=E4gen Sie bitte den erneuten Versand.=
 In dem Fall, da=DF Sie diese E-Mail h=E4tten erhalten sollen, informieren =
Sie bitte den Absender =FCber Ihren Wunsch, die E-Mail erneut zu versenden.

Wir m=F6chten uns f=FCr die Unannehmlichkeiten entschuldigen.

F=FCr R=FCckfragen steht Ihnen die E-Mail-Administration des ITZBund gerne =
zur Verf=FCgung.


Freundliche Gr=FC=DFe

Ihre E-Mail-Administration
_______________________________________
V A 51 40 - Gateway-Systeme und Schnittstellen
Informationstechnikzentrum Bund (ITZBund)

Postanschrift: Postfach 301645, 53196 Bonn
E-Mail: VA5140@itzbund.de

