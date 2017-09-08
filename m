From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: samsung: i2s: Use specific name for i2s dais
Date: Fri, 8 Sep 2017 18:43:30 +0200
Message-ID: <20170908164330.pw3fxcxvrnajlaox@kozik-lap>
References: <20170906010415.26952-1-jcsing.lee@samsung.com>
 <CGME20170906010417epcas2p208db637d89a670d01fa3dbeb78ff0da0@epcas2p2.samsung.com>
 <20170906010415.26952-2-jcsing.lee@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:38860 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753132AbdIHQno (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Sep 2017 12:43:44 -0400
Content-Disposition: inline
In-Reply-To: <20170906010415.26952-2-jcsing.lee@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jaechul Lee <jcsing.lee@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, galaxyra@gmail.com, Chanwoo Choi <cw00.choi@samsung.com>

On Wed, Sep 06, 2017 at 10:04:13AM +0900, Jaechul Lee wrote:
> Add specific dais name when components are registered. Component and dai
> name will follow their parent dev name, if the name isn't described.  In
> case of this driver, each dais will have same name like '11440000.i2s0' by
> fmt_single_name function.
> 
> The problem having same name is that TM2 machine driver can't detect
> capture devices correctly. Machine driver doesn't know which one is proper
> to use for cpu dai. The driver just selects to use 'samsung-i2c-sec' that
> doesn't have capture functionality because the component of
> samsung-i2s-sec is located in the first of the component_list.
> 
> I add dai name like 'samsung-i2s', 'samsung-i2s-sec' for each dais. The
> reason why adding dai id to 1 is that it doesn't allow to use particular
> dai name in case of when I use 0 for dai id.
> 
> Signed-off-by: Jaechul Lee <jcsing.lee@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 4 ++++
>  sound/soc/samsung/i2s.h | 3 +++
>  2 files changed, 7 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
