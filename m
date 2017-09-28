From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 13/17] media: v4l2-async: simplify v4l2_async_subdev
 structure
Date: Thu, 28 Sep 2017 15:09:21 +0300
Message-ID: <20170928120920.ywgbtikkrts25qlj@valkosipuli.retiisi.org.uk>
References: <cover.1506548682.git.mchehab@s-opensource.com>
 <cd089c6dac22c8ea2194c47c48386e52bb6e561f.1506548682.git.mchehab@s-opensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
Content-Disposition: inline
In-Reply-To: <cd089c6dac22c8ea2194c47c48386e52bb6e561f.1506548682.git.mchehab@s-opensource.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Songjun Wu <songjun.wu@microchip.com>, "Lad,
 Prabhakar" <prabhakar.csengg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Javi Merino <javi.merino@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, Yannick Fertre <yannick.fertre@st.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Kukjin Kim <kgene@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Tuukka Toivonen <tuukka.toivonen@intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Linux Media Mailing List <linux-media@vger.kernel.o>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mauro,

On Wed, Sep 27, 2017 at 06:46:56PM -0300, Mauro Carvalho Chehab wrote:
> The V4L2_ASYNC_MATCH_FWNODE match criteria requires just one
> struct to be filled (struct fwnode_handle). The V4L2_ASYNC_MATCH_DEVNAME
> match criteria requires just a device name.
> 
> So, it doesn't make sense to enclose those into structs,
> as the criteria can go directly into the union.
> 
> That makes easier to document it, as we don't need to document
> weird senseless structs.

The idea is that in the union, there's a struct which is specific to the
match_type field. I wouldn't call it senseless.

In the two cases there's just a single field in the containing struct. You
could remove the struct in that case as you do in this patch, and just use
the field. But I think the result is less clean and so I wouldn't make this
change.

The confusion comes possibly from the fact that the struct is named the
same as the field in the struct. These used to be called of and node, but
with the fwnode property framework the references to the fwnode are, well,
typically similarly called "fwnode". There's no underlying firmware
interface with that name, fwnode property API is just an API.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi
