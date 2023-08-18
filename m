Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E57CC71153
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Aug 2023 09:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358904AbjHRJCZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 05:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358982AbjHRJCQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 05:02:16 -0400
X-Greylist: delayed 1520 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:01:55 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D74E3C17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 02:01:55 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id B021F841A5; Fri, 18 Aug 2023 09:16:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346572; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=gYspVa2l+Cd6wAYUZFwXcPoBN9hp38aImaugIi/GXiYDJ1TAmiY4pDzPloELQXlaX
         DhhYlnAUSHf0j2OonvCxFY2Yv5sRtczpAcfqqz8yILnoaUc+/Rc3qI3AV94PloVeFe
         rnReKtNUTsHCbL5KRl1Je/tDBcgx9spyUAckKMGhgTgIYUIr3QI4/8eHz2eIYhjk4N
         CG7QtcfARrQAzUtl+mUE42i+cz4pvMJnnzOCmYtA3RzY3abfhyHBehIzJ3U2FjpN5Q
         DNmKUSBHfyTzOgcjAw2CmMPTch8SBq1zJAGMxwzvzGFj0paoS239tqHc24WOzd+Xud
         lnKA5ow0TTFQQ==
Received: by mail.leachkin.pl for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.ctzs.0.fr6bjeiycr@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-samsung-soc@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
