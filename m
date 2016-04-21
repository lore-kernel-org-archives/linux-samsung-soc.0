From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [RFT PATCH v2] [media] exynos4-is: Fix
 fimc_is_parse_sensor_config() nodes handling
Date: Thu, 21 Apr 2016 09:21:32 -0400
Message-ID: <5718D3DC.20004@osg.samsung.com>
References: <1458780100-8865-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458780100-8865-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Sylwester,

On 03/23/2016 08:41 PM, Javier Martinez Canillas wrote:
> The same struct device_node * is used for looking up the I2C sensor, OF
> graph endpoint and port. So the reference count is incremented but not
> decremented for the endpoint and port nodes.
> 
> Fix this by having separate pointers for each node looked up.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>

Any comments about this patch?

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
