From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCH] S3C24XX DMA resume regression fix
Date: Sun, 15 Jan 2012 01:52:17 +0400
Message-ID: <4F11F911.7030609@ru.mvista.com>
References: <1326462444-10567-1-git-send-email-dron0gus@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.dev.rtsoft.ru ([213.79.90.226]:51281 "HELO
	mail.dev.rtsoft.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757162Ab2ANVxZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Jan 2012 16:53:25 -0500
In-Reply-To: <1326462444-10567-1-git-send-email-dron0gus@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gusakov Andrey <dron0gus@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello.

On 13-01-2012 17:47, Gusakov Andrey wrote:

> In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b suspend/resume

    Please also specify that commit's summary in parens.

> hooks were added. s3c2410_dma_suspend suspends channels from 0 to
> dma_channels. s3c2410_dma_resume resumes channels in reverse
> order. So pointer should be decremented insted of being incremented.

> Signed-off-by: Gusakov Andrey<dron0gus@gmail.com>

WBR, Sergei
