From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 11:19:35 +0900
Message-ID: <AANLkTi=Q+GQN9RP=aCZ-Uav3FfEg1dPT04n=jywWLqjF@mail.gmail.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
	<1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
	<AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
	<AANLkTimbHbO77POKuu=3XAO6Cq7UaAjJ291hwQqKTcNW@mail.gmail.com>
	<AANLkTinaDckVpJhadBcnhccdougyCG-FbXe23dh=_ep8@mail.gmail.com>
	<AANLkTinYHSUP5AspWbzD8hfKJtEaFAfcUYC0sOPy+WKX@mail.gmail.com>
	<AANLkTi=qmEHozO+1YtySkcmvr=QP973JtanQogqT82b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61764 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757068Ab0JUCTh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 22:19:37 -0400
Received: by bwz18 with SMTP id 18so42270bwz.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2010 19:19:35 -0700 (PDT)
In-Reply-To: <AANLkTi=qmEHozO+1YtySkcmvr=QP973JtanQogqT82b4@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, Seungwhan Youn <sw.youn@samsung.com>

On Thu, Oct 21, 2010 at 11:12 AM, Kyungmin Park <kmpark@infradead.org> wrote:

> BTW, what's the id of mdma and which clock at c210?

MDMA is not yet supported in Samsung mainline.
Any ID can be assigned as long as it doesn't conflict with other DMAs
and resources correctly attached to it.
