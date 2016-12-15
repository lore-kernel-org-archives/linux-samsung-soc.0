From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] media: platform: s3c-camif: constify v4l2_subdev_ops
 structures
Date: Thu, 15 Dec 2016 11:34:38 +0100
Message-ID: <91f5f6ee-d5b0-ff6b-a254-dfcc5f6d6fb1@samsung.com>
References: <CGME20161214111230epcas2p3c17ddece4633cdd49ee7759b8215da23@epcas2p3.samsung.com>
 <1481713870-7513-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1481713870-7513-1-git-send-email-bhumirks@gmail.com>
Sender: linux-media-owner@vger.kernel.org
To: Bhumika Goyal <bhumirks@gmail.com>, linux-media@vger.kernel.org
Cc: julia.lawall@lip6.fr, mchehab@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 12/14/2016 12:11 PM, Bhumika Goyal wrote:
> Check for v4l2_subdev_ops structures that are only passed as an
> argument to the function v4l2_subdev_init. This argument is of type
> const, so v4l2_subdev_ops structures having this property can also  be
> declared const.

> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
