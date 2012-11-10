From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] ARM: S3C64XX: Remove duplicated camera clock
Date: Sat, 10 Nov 2012 22:23:13 +0100
Message-ID: <509EC5C1.2000901@gmail.com>
References: <509e602f.a766980a.0f91.14f4@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:60081 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451Ab2KJVXS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 10 Nov 2012 16:23:18 -0500
Received: by mail-wi0-f170.google.com with SMTP id hm9so1425849wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Nov 2012 13:23:16 -0800 (PST)
In-Reply-To: <509e602f.a766980a.0f91.14f4@mx.google.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dron0gus@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, sylvester.nawrocki@gmail.com, Andrey Gusakov <dron_gus@mail.ru>

On 11/10/2012 03:07 PM, dron0gus@gmail.com wrote:
> From: Andrey Gusakov<dron_gus@mail.ru>
>
> Camera clock defined two times. One in init_clocks_off array with
> "cam" name, second in clksrcs array with "camera" name. Leave
> second definition because clock have divider.
>
> Signed-off-by: Andrey Gusakov<dron0gus@gmail.com>

Reviewed-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
