From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] regulator: max77802: Fix DT binding document reference
Date: Mon, 1 Feb 2016 09:20:27 -0600
Message-ID: <20160201152027.GA14117@rob-hp-laptop>
References: <1454083741-25626-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1454083741-25626-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jan 29, 2016 at 01:09:00PM -0300, Javier Martinez Canillas wrote:
> The DT binding doc references the max77802 clocks header file which makes
> no sense since of course it doesn't contain data related to the regulators.
> 
> It's a copy and paste error, so add a reference to the correct header file.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by: Rob Herring <robh@kernel.org>
