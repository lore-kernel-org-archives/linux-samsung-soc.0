From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: s5p-jpeg: Correct step and max values for
 V4L2_CID_JPEG_RESTART_INTERVAL
Date: Thu, 10 Jan 2019 10:58:19 +0100
Message-ID: <146706fc-007a-c4f9-7ecf-b1bd893bb79d@samsung.com>
References: <20190109180041.31052-1-pawel.mikolaj.chmiel@gmail.com>
        <CGME20190110095823epcas2p1936a8d201409b837f9cbd12497fb0e25@epcas2p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190109180041.31052-1-pawel.mikolaj.chmiel@gmail.com>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc: jacek.anaszewski@gmail.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 1/9/19 19:00, Paweł Chmiel wrote:
> This commit corrects max and step values for v4l2 control for
> V4L2_CID_JPEG_RESTART_INTERVAL. Max should be 0xffff and step should be 1.
> It was found by using v4l2-compliance tool and checking result of
> VIDIOC_QUERY_EXT_CTRL/QUERYMENU test.
> Previously it was complaining that step was bigger than difference
> between max and min.
> 
> Fixes: 15f4bc3b1f42 ("[media] s5p-jpeg: Add JPEG controls support")
> Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
