From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH RFC v5 8/8] [media] media: rename the function that create
 pad links
Date: Wed, 19 Aug 2015 10:38:26 +0200
Message-ID: <55D44082.6000600@xs4all.nl>
References: <cover.1439927113.git.mchehab@osg.samsung.com>
 <4b0c0aa7604f5202401997f946297c0b35c1b692.1439927113.git.mchehab@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <4b0c0aa7604f5202401997f946297c0b35c1b692.1439927113.git.mchehab@osg.samsung.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, Jiayi Ye <yejiayily@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Matthias Schwarzott <zzam@gentoo.org>, Olli Salonen <olli.salonen@iki.fi>, Heena Sirwani <heenasirwani@gmail.com>, devel@driverdev.osuosl.org, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-samsung-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-doc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, Antti Palosaari <crope@iki.fi>, linux-arm-kernel@lists.infradead.org, Navya Sri Nizamkari <navyasri.tech@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, =?windows-1252?Q?S=F6
List-Id: linux-samsung-soc@vger.kernel.org

On 08/18/2015 10:04 PM, Mauro Carvalho Chehab wrote:
> Now that a link can be either between two different graph
> objects, we'll need to add more functions to create links.
> So, rename the existing one that create links only between
> two pads as media_create_pad_link().
> 
> No functional changes.
> 
> This patch was created via this shell script:
> 	for i in $(find drivers/media -name '*.[ch]' -type f) $(find drivers/staging/media -name '*.[ch]' -type f) $(find include/ -name '*.h' -type f) ; do sed s,media_entity_create_link,media_create_pad_link,g <$i >a && mv a $i; done
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
>

Acked-by: Hans Verkuil <hans.verkuil@cisco.com>

Thanks!

	Hans
