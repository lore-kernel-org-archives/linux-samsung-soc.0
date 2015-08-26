From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Subject: Re: [PATCH v7 10/44] [media] media: rename the function that create
 pad links
Date: Wed, 26 Aug 2015 11:54:03 -0300
Message-ID: <20150826115403.7a794597@recife.lan>
References: <cover.1440359643.git.mchehab@osg.samsung.com>
	<f095b87884d435e296a455ab07a9951a74c0c3a6.1440359643.git.mchehab@osg.samsung.com>
	<55DCBA2D.9090901@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <55DCBA2D.9090901@osg.samsung.com>
Sender: linux-sh-owner@vger.kernel.org
To: Shuah Khan <shuahkh@osg.samsung.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hyun Kwon <hyun.kwon@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hans.verkuil@cisco.com>, Rafael =?UTF-8?B?TG91cmVuw6dv?= de Lima Chehab <chehabrafael@gmail.com>, Matthias Schwarzott <zzam@gentoo.org>, Antti Palosaari <crope@iki.fi>, Olli Salonen <olli.salonen@iki.fi>, Tommi Rantala <tt.rantala@gmail.com>, Hane
List-Id: linux-samsung-soc@vger.kernel.org

Em Tue, 25 Aug 2015 12:55:41 -0600
Shuah Khan <shuahkh@osg.samsung.com> escreveu:

> On 08/23/2015 02:17 PM, Mauro Carvalho Chehab wrote:
> > Now that a link can be either between two different graph
> > objects, we'll need to add more functions to create links.
> 
> Is this an incomplete sentence. Should it read: "either between
> two different graph objects or two pads" ?

That would be redundant, as pad is a graph object ;)

> 
> > So, rename the existing one that create links only between
> > two pads as media_create_pad_link().
> 
> > 
> > No functional changes.
> > 
> > This patch was created via this shell script:
> > 	for i in $(find drivers/media -name '*.[ch]' -type f) $(find drivers/staging/media -name '*.[ch]' -type f) $(find include/ -name '*.h' -type f) ; do sed s,media_entity_create_link,media_create_pad_link,g <$i >a && mv a $i; done
> > 
> 
> Didn't want to experiment with Coccinelle?? :)

I use Coccinelle, but only when I need more complex changes, as
Coccinelle may mangle with comments.

> 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> > Acked-by: Hans Verkuil <hans.verkuil@cisco.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
> > 
> 
> Changes look good to me. After fixing the commit log:
> 
> Acked-by: Shuah Khan <shuahkh@osg.samsung.com>
> 
> thanks,
> -- Shuah
> 
> 
