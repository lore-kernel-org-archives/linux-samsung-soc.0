From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/6] ARM: dts: Create fragment for tps65090 PMU
Date: Wed, 13 Aug 2014 10:12:12 -0600
Message-ID: <53EB8E5C.3030902@wwwdotorg.org>
References: <1407861868-20097-1-git-send-email-javier.martinez@collabora.co.uk> <1407861868-20097-2-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:37805 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752831AbaHMQL7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Aug 2014 12:11:59 -0400
In-Reply-To: <1407861868-20097-2-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 08/12/2014 10:44 AM, Javier Martinez Canillas wrote:
> The tps65090 is a Power Management Unit (PMU) used in several
> boards so the same information is described on different DTS.
> It is better to create a .dtsi fragment that can be included.

To be honest, I'm not sure that this file is useful. The entire content 
of this file (with the exception of the compatible value and possibly 
the charger sub-node) needs to be repeated in any file that includes it, 
in order to add properties into all the nodes.
