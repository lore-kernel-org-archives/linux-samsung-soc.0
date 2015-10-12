From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH 1/1] media: Correctly determine whether an entity is a
 sub-device
Date: Mon, 12 Oct 2015 12:58:06 -0300
Message-ID: <20151012125806.65ad436a@recife.lan>
References: <20151011215625.779630d9@recife.lan>
 <1444664303-18454-1-git-send-email-sakari.ailus@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1444664303-18454-1-git-send-email-sakari.ailus@iki.fi>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org, k.kozlowski@samsung.com, lars@metafoo.de, sakari.ailus@linux.intel.com, hyun.kwon@xilinx.com, linux-sh@vger.kernel.org, gregkh@linuxfoundation.org, michal.simek@xilinx.com, mchehab@infradead.org, javier@osg.samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, hans.verkuil@cisco.com, laurent.pinchart@ideasonboard.com, s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, prabhakar.csengg@gmail.com, elfring@users.sourceforge.net, soren.brinkmann@xilinx.com, linux-media@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Em Mon, 12 Oct 2015 18:38:23 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> If the function of an entity is not one of the pre-defined ones, it is not
> correctly recognised as a V4L2 sub-device.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/media-entity.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index a60872a..76e9a124 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -328,6 +328,7 @@ static inline bool is_media_entity_v4l2_subdev(struct media_entity *entity)
>  	case MEDIA_ENT_F_LENS:
>  	case MEDIA_ENT_F_ATV_DECODER:
>  	case MEDIA_ENT_F_TUNER:
> +	case MEDIA_ENT_F_V4L2_SUBDEV_UNKNOWN:
>  		return true;

OK.

Reviewed-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

>  
>  	default:
