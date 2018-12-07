From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] media: Use of_node_name_eq for node name comparisons
Date: Fri, 07 Dec 2018 11:02:05 +0100
Message-ID: <63971417-f761-e891-f410-9efa26dd2c6d@samsung.com>
References: <20181206193519.13367-1-robh@kernel.org>
        <CGME20181207100211epcas1p2caa3a1da5152bd7c1476d795e788e776@epcas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20181206193519.13367-1-robh@kernel.org>
Content-language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Benoit Parrot <bparrot@ti.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 12/6/18 20:35, Rob Herring wrote:
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - Also convert tabs to spaces between the 'if' and '('

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
